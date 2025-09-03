// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/27
// Description:
// -------------------------------------------------------------------
import 'package:auth/l10n/auth_biz_registrar.dart';
import 'package:business_failure_i18n/business_failure_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poyopoyo_weather/l10n/weather_error_registrar.dart';

void setupBusinessI18n(WidgetRef ref) {
  final reg = ref.read(bizFailureRegistryProvider);
  registerAuthBizI18n(reg);
  registerWeatherErrorI18n(reg);
}
