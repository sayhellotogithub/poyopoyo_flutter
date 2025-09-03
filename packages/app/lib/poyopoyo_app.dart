// entry point
import 'package:action_policy/action_policy.dart';
import 'package:auth/l10n/auth_localizations.dart';
import 'package:auth/presentation/router/auth_module.dart';
import 'package:di/action_policy_providers.dart';
import 'package:di/bootstrap.dart';
import 'package:error_lab/error_lab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/locale.dart';
import 'package:network_failure_i18n/l10n/network_failure_localizations.dart';
import 'package:plugin/module_interface.dart';
import 'package:poyopoyo_weather/l10n/weather_localizations.dart';
import 'package:poyopoyo_weather/weather.dart';
import 'package:settings/presentation/router/settings_module.dart';
import 'package:theme/app_theme.dart';
import 'package:theme/theme_provider.dart';
import 'package:ui/ui.dart';

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
          AuthModule(),
          WeatherModule(),
          ErrorLabModule(),
        ];
        final actionPolicyReg = ActionPolicyRegistry(allowOverride: true);
        final bootstrap = AppBootstrap(modules);
        final bootstrapResult =
            bootstrap.build(actionPolicyBuilder: actionPolicyReg);
        final locale = ref.watch(localeProvider);

        return ProviderScope(
          overrides: [
            ...bootstrapResult.overrides,
            actionPolicyProvider.overrideWithValue(actionPolicyReg),
            unifiedErrorUiConfigProvider.overrideWithValue(
              UnifiedErrorUiConfig.defaults(
                showSnackBar: (ctx, text, {onRetry}) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(
                      content: Text(text),
                      action: onRetry != null
                          ? SnackBarAction(label: 'Retry', onPressed: onRetry)
                          : null,
                    ),
                  );
                },
                showDialog: (ctx, text) => showDialog(
                  context: ctx,
                  builder: (_) => AlertDialog(content: Text(text)),
                ),
                go: (ctx, route) => GoRouter.of(ctx).go(route),
              ),
            ),
          ],
          child: MaterialApp.router(
              title: 'Poyopoyo Flutter',
              theme: AppTheme.light,
              themeMode: themeMode,
              darkTheme: AppTheme.dark,
              routerConfig: bootstrapResult.router,
              locale: locale,
              showPerformanceOverlay: false,
              supportedLocales: const [
                ...NetworkFailureLocalizations.supportedLocales,
                ...AuthLocalizations.supportedLocales,
              ],
              localizationsDelegates: const [
                ...NetworkFailureLocalizations.localizationsDelegates,
                AuthLocalizations.delegate,
                WeatherLocalizations.delegate,
              ]),
        );
      },
    );
  }
}
