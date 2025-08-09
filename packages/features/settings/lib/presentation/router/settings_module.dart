// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description:
// -------------------------------------------------------------------
import 'package:di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plugin/module_interface.dart';
import 'package:settings/presentation/screens/settings_screen.dart';

import '../../data/services/settings_service_impl.dart';

class SettingsModule extends AppModule {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ];

  @override
  List<Override> get overrides => [
        settingsServiceProvider.overrideWith((ref) => SettingsServiceImpl()),
      ];
}
