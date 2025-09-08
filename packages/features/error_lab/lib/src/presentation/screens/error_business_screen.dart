// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/04
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localiztion.dart';

import '../../../l10n/error_lab_localizations.dart';
import '../viewmodel/business_vm.dart';

class ErrorBusinessScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ErrorBusinessScreenState();
  }
}

class _ErrorBusinessScreenState extends ConsumerState<ErrorBusinessScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(errorBusinessVMProvider.notifier).runScenario(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final errorBusinessState = ref.watch(errorBusinessVMProvider);
    final failureLocalizer = ref.watch(failureLocalizerProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text(
              ErrorLabLocalizations.of(context)!.error_lab_net_error_code)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: errorBusinessState.codes.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, i) {
          final bean = errorBusinessState.codes[i];
          return ListTile(
            title: Text(bean.code),
            subtitle:
                Text(failureLocalizer.biz.localize(context, bean.failure)),
            leading: const Icon(Icons.error_outline),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('点击了: ${bean.code}')),
              );
            },
          );
        },
      ),
    );
  }
}
