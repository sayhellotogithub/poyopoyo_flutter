// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description: 
// -------------------------------------------------------------------
import 'package:go_router/go_router.dart';
import 'package:plugin/module_interface.dart';
import 'package:settings/presentation/screens/settings_screen.dart';

class SettingsModule extends AppModule {
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ];
}