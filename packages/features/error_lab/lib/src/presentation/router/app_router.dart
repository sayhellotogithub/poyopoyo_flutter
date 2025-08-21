// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/18
// Description:
// -------------------------------------------------------------------
import 'package:go_router/go_router.dart';
import 'package:poyopoyo_weather/src/presentation/screens/home_screen.dart';
import 'package:poyopoyo_weather/src/presentation/screens/settings_screen.dart';

import '../screens/city_weather_detail_screen.dart';
import '../utils/go_router_helpers.dart';

final homePath = "/home";
final settingPath = "/setting";
final weatherDetailPath = "/weatherDetail";

List<GoRoute> routers = [
  GoRoute(path: '/', builder: (context, state) => HomeScreen()),
  GoRouteX.custom(path: settingPath, builder: (_, __) => SettingsScreen()),
  GoRouteX.custom(
    path: weatherDetailPath,
    builder: (_, state) {
      final cityName = state.extra as String;
      return CityWeatherDetailScreen(cityName: cityName);
    },
  ),
];

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ...routers,
    // Placeholder for search city screen
  ],
);
