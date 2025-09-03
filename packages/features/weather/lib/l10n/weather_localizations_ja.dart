// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'weather_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class WeatherLocalizationsJa extends WeatherLocalizations {
  WeatherLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get weather_appTitle => 'ポヨポヨ 天気';

  @override
  String get weather_settings => '設定';

  @override
  String get weather_theme_setting => '🌗 テーマ設定';

  @override
  String get weather_language_setting => '🌐 言語設定';

  @override
  String get weather_light => 'ライト';

  @override
  String get weather_dark => 'ダーク';

  @override
  String get weather_japanese => '日本語';

  @override
  String get weather_english => '英語';

  @override
  String get weather_errorTimeout => '接続がタイムアウトしました';

  @override
  String get weather_errorServer => 'サーバーエラーが発生しました';

  @override
  String get weather_errorUnknown => '不明なエラーが発生しました';

  @override
  String get weather_cityNotFound => '都市が見つかりませんでした';

  @override
  String get weather_showErrorTest => '気象誤差テスト';

  @override
  String get weather_searchHint => '都市を検索';

  @override
  String get weather_cancel => 'キャンセル';

  @override
  String get weather_dataNotFound => 'データが見つかりませんでした';

  @override
  String get weather_fiveDayForecast => '5日間予報';

  @override
  String weather_tempHighLow(String max, String min) {
    return '最高 $max° 最低 $min°';
  }
}
