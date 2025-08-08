// entry point
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plugin/module_interface.dart';
import 'package:settings/presentation/router/settings_module.dart';
import 'package:theme/app_theme.dart';
import 'package:theme/theme_provider.dart';

class PoyopoyoApp extends ConsumerWidget {
  const PoyopoyoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);

    return themeModeAsync.when(
      loading: () => const MaterialApp(home: SizedBox.shrink()),
      error: (e, _) => MaterialApp(home: Text('Error: \$e')),
      data: (themeMode) {
        final modules = <AppModule>[
          SettingsModule(),
        ];

        final router = GoRouter(
          routes: [
            for (final m in modules) ...m.routes,
          ],
        );

        final overrides = [
          for (final m in modules) ...m.overrides,
        ];

        return ProviderScope(
          overrides: overrides,
          child: MaterialApp.router(
            title: 'Poyopoyo Flutter',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            routerConfig: router,
          ),
        );
      },
    );
  }
}