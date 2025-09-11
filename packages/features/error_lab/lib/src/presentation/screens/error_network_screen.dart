// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/04
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localiztion.dart';
import 'package:ui/ui.dart';

import '../../../l10n/error_lab_localizations.dart';
import '../viewmodel/network_vm.dart';

class ErrorNetworkScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ErrorNetworkScreenState();
  }
}

class _ErrorNetworkScreenState extends ConsumerState<ErrorNetworkScreen> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(errorNetworkVMProvider.notifier).runScenario(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final errorNetworkState = ref.watch(errorNetworkVMProvider);
    final failureLocalizer = ref.watch(failureLocalizerProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text(
              ErrorLabLocalizations.of(context)!.error_lab_net_error_code)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: errorNetworkState.codes.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, i) {
          final code = errorNetworkState.codes[i];
          return ListTile(
            title: Text(code.code.name),
            subtitle:
                Text(failureLocalizer.net.localize(context, code.failure)),
            leading: const Icon(Icons.error_outline),
            onTap: () {
              UnifiedErrorPresenterX.of(ref).handle(context, code.failure);
            },
          );
        },
      ),
    );
  }
}
