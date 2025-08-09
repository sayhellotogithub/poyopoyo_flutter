// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description: 
// -------------------------------------------------------------------
import 'package:di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plugin/module_interface.dart';

import '../../data/services/auth_service_impl.dart';

class AuthModule extends AppModule {
  @override
  List<Override> get overrides => [
    authServiceProvider.overrideWith((ref) => AuthServiceImpl()),
  ];

  @override
  List<GoRoute> routes = const [];
}