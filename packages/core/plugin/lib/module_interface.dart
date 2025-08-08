// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description: 
// -------------------------------------------------------------------

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

abstract class AppModule {
  List<GoRoute> get routes;
  List<Override> get overrides => const [];
}