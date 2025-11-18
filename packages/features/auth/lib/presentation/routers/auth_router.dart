// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description:
// -------------------------------------------------------------------

import 'package:auth/presentation/screens/auth_debug_screen.dart';
import 'package:go_router/go_router.dart';

final authDebug = "/auth/authDebug";

List<GoRoute> routers = [
  GoRoute(path: "/", builder: (context, state) => AuthDebugPage()),
  GoRoute(path: authDebug, builder: (context, state) => AuthDebugPage())
];
