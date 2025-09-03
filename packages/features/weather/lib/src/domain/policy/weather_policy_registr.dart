// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/01
// Description:
// -------------------------------------------------------------------

import 'package:action_policy/action_policy.dart';
import 'package:poyopoyo_weather/src/domain/errorcode/weather_codes.dart';

void registerWeatherActionPolicy(ActionPolicyBuilder reg) {
  reg.registerCode(
    WeatherCodes.weatherErrorShow,
    (_) => ErrorAction.showDialog,
  );
  reg.registerCode(WeatherCodes.notFoundCity, (_) => ErrorAction.showToast);
}
