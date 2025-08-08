// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description: 
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/theme_provider.dart';
import 'package:widgets/app_button.dart';
import 'package:widgets/app_card.dart';
import '';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '主题切换',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              themeModeAsync.when(
                data: (mode) => AppButton(
                  label: mode == ThemeMode.light ? '切换为暗黑模式' : '切换为亮色模式',
                  onPressed: () => ref.read(themeModeProvider.notifier).toggle(),
                ),
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('加载主题失败: \$e'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}