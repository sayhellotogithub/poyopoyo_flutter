// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description: 
// -------------------------------------------------------------------
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plugin/module_interface.dart';

class AppBootstrap {
  final List<AppModule> modules;
  AppBootstrap(this.modules);

  (GoRouter, List<Override>) build() {
    final router = GoRouter(
      routes: [for (final m in modules) ...m.routes],
    );

    final overrides = <Override>[
      for (final m in modules) ...m.overrides,
    ];

    return (router, overrides);
  }
}