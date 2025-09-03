// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/27
// Description:
// -------------------------------------------------------------------
import 'package:business_failure_i18n/business_failure_i18n.dart';
import 'package:poyopoyo_weather/l10n/weather_localizations.dart';
import 'package:poyopoyo_weather/src/domain/errorcode/weather_codes.dart';

void registerWeatherErrorI18n(IBizFailureRegistry reg) {
  reg.register(WeatherCodes.weatherErrorShow, (ctx, f) {
    final s = WeatherLocalizations.of(ctx)!;
    return s.weather_showErrorTest;
  });
  reg.register(WeatherCodes.notFoundCity, (ctx, f) {
    final s = WeatherLocalizations.of(ctx)!;
    return s.weather_cityNotFound;
  });
}
