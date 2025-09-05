// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/20
// Description:
// -------------------------------------------------------------------
import 'package:error_lab/src/presentation/model/error_scenario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/ui.dart';

import '../../data/test_repository.dart';
import '../router/app_router.dart';

class ErrorLabHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Lab"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FilledButton(
              onPressed: () {
                context.go(networkFailurePath);
              },
              child: const Text("ネットワークエラー表示")),
          const SizedBox(
            height: 12,
          ),
          FilledButton(
              onPressed: () {
                context.go(businessFailurePath);
              },
              child: const Text("ビジネスエラー表示")),
        ],
      ),
    );
  }
}

// class ErrorLabHomeScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final scenarios = PresetScenarios.all;
//     return Scaffold(
//         appBar: AppBar(title: Text('Error Lab|network&business error test')),
//         body: ListView.separated(
//             padding: const EdgeInsets.all(16),
//             itemBuilder: (_, i) => _ScenarioCard(scenario: scenarios[i]),
//             separatorBuilder: (_, __) => const SizedBox(height: 16),
//             itemCount: scenarios.length));
//   }
// }

class _ScenarioCard extends ConsumerWidget {
  final ErrorScenario scenario;

  const _ScenarioCard({required this.scenario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subtitle = switch (scenario.kind) {
      ScenarioKind.network =>
        'Network:${scenario.netKind}${scenario.httpStatus != null}',
      ScenarioKind.business => 'Business:${scenario.bizCode}',
    };
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(scenario.title,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
                ],
              )),
              FilledButton(
                  onPressed: () async {
                    final repo = TestRepository.withScenario(scenario);

                    final data = await UnifiedErrorPresenterX.of(ref)
                        .guard(context, () async {
                      return await repo.runScenario(); // 可能抛 Failure
                    }, onRetry: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('retry')),
                      );
                    });
                  },
                  child: const Text('Run')),
            ],
          )),
    );
  }
}
