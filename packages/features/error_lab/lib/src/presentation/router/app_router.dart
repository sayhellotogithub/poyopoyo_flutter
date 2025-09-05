// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/18
// Description:
// -------------------------------------------------------------------
import 'package:error_lab/src/presentation/screens/error_network_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/error_lab_home_screen.dart';

final errorLabHomePath = "/errorLabHome";
final networkFailurePath = "/networkFailure";
final businessFailurePath = "/businessFailure";

List<GoRoute> routeList = [
  GoRoute(path: '/', builder: (context, state) => ErrorLabHomeScreen()),
  GoRoute(
      path: networkFailurePath,
      builder: (context, state) => ErrorNetworkScreen()),
  GoRoute(path: businessFailurePath,
      builder: (context, state) => ErrorLabHomeScreen())
];
