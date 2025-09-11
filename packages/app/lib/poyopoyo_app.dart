// entry point
import 'package:action_policy/action_policy.dart';
import 'package:auth/l10n/auth_localizations.dart';
import 'package:auth/presentation/router/auth_module.dart';
import 'package:business_failure_i18n/l10n/business_failure_localizations.dart';
import 'package:di/action_policy_providers.dart';
import 'package:di/bootstrap.dart';
import 'package:error_lab/error_lab.dart';
import 'package:error_lab/l10n/error_lab_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/locale.dart';
import 'package:login/login.dart';
import 'package:network_failure_i18n/l10n/network_failure_localizations.dart';
import 'package:plugin/module_interface.dart';
import 'package:poyopoyo_weather/l10n/weather_localizations.dart';
import 'package:poyopoyo_weather/weather.dart';
import 'package:settings/presentation/router/settings_module.dart';
import 'package:theme/app_theme.dart';
import 'package:theme/theme_provider.dart';
import 'package:ui/ui.dart';

import 'bootstrap/biz_i18n_bootstrap.dart';

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
          LoginModule()
        ];
        final actionPolicyReg = ActionPolicyRegistry(allowOverride: true);
        final bootstrap = AppBootstrap(modules);
        final bootstrapResult =
            bootstrap.build(actionPolicyBuilder: actionPolicyReg);
        final locale = ref.watch(localeProvider);
        setupBusinessI18n(ref);
        return ProviderScope(
          overrides: [
            ...bootstrapResult.overrides,
            actionPolicyProvider.overrideWithValue(actionPolicyReg),
            unifiedErrorUiConfigProvider
                .overrideWithValue(UnifiedErrorUiConfig.defaults(
              navigate: (context, route) => context.go(route),
              routeConfig: const ErrorRouteConfig(),
              handlingConfig: ErrorHandlingConfig.business(),
            )),
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
                ErrorLabLocalizations.delegate,
                BusinessFailureLocalizations.delegate,
              ]),
        );
      },
    );
  }
}
