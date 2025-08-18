// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/21
// Description:
// -------------------------------------------------------------------

import '../../../l10n/weather_localizations.dart';
import '../../core/network/dio_helper.dart';

class ErrorTranslator {
  static String getMessage(String key, WeatherLocalizations loc) {
    switch (key) {
      case ErrorKeys.timeout:
        return loc.weather_errorTimeout;
      case ErrorKeys.server:
        return loc.weather_errorServer;
      case ErrorKeys.notFound:
        return loc.weather_cityNotFound;
      case ErrorKeys.unknown:
      default:
        return loc.weather_errorUnknown;
    }
  }
}
