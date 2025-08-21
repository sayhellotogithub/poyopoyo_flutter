// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/20
// Description:
// -------------------------------------------------------------------
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/src/route.dart';
import 'package:plugin/module_interface.dart';

class ErrorLabModule extends AppModule {
  @override
  List<GoRoute> get routes => throw UnimplementedError();

  @override
  List<Override> get overrides => [];
}
