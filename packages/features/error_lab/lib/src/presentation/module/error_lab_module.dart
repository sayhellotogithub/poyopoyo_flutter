// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/20
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/src/route.dart';
import 'package:plugin/module_interface.dart';

import '../../domain/policy/error_lab_policy_registr.dart';
import '../router/app_router.dart';

class ErrorLabModule extends AppModule {
  @override
  List<GoRoute> get routes => routeList;

  @override
  List<Override> get overrides => [];

  @override
  void registerActionPolicy(ActionPolicyBuilder reg) {
    registerErrorLabActionPolicy(reg);
  }
}
