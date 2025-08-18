// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'weather_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class WeatherLocalizationsEn extends WeatherLocalizations {
  WeatherLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get weather_appTitle => 'PoyoPoyo Weather';

  @override
  String get weather_settings => 'Settings';

  @override
  String get weather_theme_setting => '🌗 Theme Setting';

  @override
  String get weather_language_setting => '🌐 Language Setting';

  @override
  String get weather_light => 'Light';

  @override
  String get weather_dark => 'Dark';

  @override
  String get weather_japanese => 'Japanese';

  @override
  String get weather_english => 'English';

  @override
  String get weather_errorTimeout => 'Connection timed out';

  @override
  String get weather_errorServer => 'Server error occurred';

  @override
  String get weather_errorUnknown => 'An unknown error occurred';

  @override
  String get weather_cityNotFound => 'City not found';

  @override
  String get weather_searchHint => 'Search city';

  @override
  String get weather_cancel => 'Cancel';

  @override
  String get weather_dataNotFound => 'No data found';

  @override
  String get weather_fiveDayForecast => '5-day forecast';

  @override
  String weather_tempHighLow(String max, String min) {
    return 'High $max° Low $min°';
  }
}
