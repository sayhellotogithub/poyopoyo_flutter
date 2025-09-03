// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plugin/module_interface.dart';

typedef BootstrapResult = ({
  GoRouter router,
  List<Override> overrides,
// List<LocalizationsDelegate<dynamic>> delegates,
// List<Locale> locales,
});

class AppBootstrap {
  final List<AppModule> modules;

  AppBootstrap(this.modules);

  BootstrapResult build({required ActionPolicyBuilder actionPolicyBuilder}) {
    final router = GoRouter(
      routes: [for (final m in modules) ...m.routes],
    );

    final overrides = <Override>[
      for (final m in modules) ...m.overrides,
    ];

    for (final m in modules) {
      m.registerActionPolicy(actionPolicyBuilder);
    }

    return (
      router: router,
      overrides: overrides,
    );
  }
}
