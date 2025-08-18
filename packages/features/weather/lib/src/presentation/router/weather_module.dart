// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/18
// Description:
// -------------------------------------------------------------------
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plugin/module_interface.dart';

import '../routes/app_router.dart';

class WeatherModule extends AppModule {
  @override
  List<Override> get overrides => [];

  @override
  List<GoRoute> routes = [...routers];
}
