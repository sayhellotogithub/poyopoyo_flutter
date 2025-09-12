// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/11
// Description:
// -------------------------------------------------------------------

import 'package:go_router/go_router.dart';
import 'package:login/src/presentation/screens/login_screen.dart';

import '../screens/kyc_screen.dart';

final login = "/login";
final kyc = "/kyc";

List<GoRoute> routeList = [
  GoRoute(path: login, builder: (context, state) => LoginScreen()),
  GoRoute(path: kyc, builder: (context, state) => KycScreen()),
];
