// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/18
// Description:
// -------------------------------------------------------------------
import 'package:go_router/go_router.dart';

import '../screens/error_lab_home_screen.dart';

final errorLabHomePath = "/errorLabHome";

List<GoRoute> routeList = [
  // GoRoute(path: '/', builder: (context, state) => ErrorLabHomeScreen()),
  GoRoute(
      path: errorLabHomePath,
      builder: (context, state) => ErrorLabHomeScreen()),
];
