// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/11
// Description:
// -------------------------------------------------------------------
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/src/route.dart';
import 'package:login/src/presentation/router/login_router.dart';
import 'package:plugin/module_interface.dart';

class LoginModule extends AppModule {
  @override
  List<GoRoute> get routes => routeList;

  @override
  List<Override> get overrides => [];
}
