// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description: 
// -------------------------------------------------------------------
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'network_failure_localizer.dart';
//Configuration Provider that can be overridden by the App
final networkI18nConfigProvider = Provider<NetworkI18nConfig>(
      (_) => const NetworkI18nConfig(),
);

final networkFailureLocalizerProvider = Provider<NetworkFailureLocalizer>((ref) {
  final cfg = ref.watch(networkI18nConfigProvider);
  return NetworkFailureLocalizer(config: cfg);
});

