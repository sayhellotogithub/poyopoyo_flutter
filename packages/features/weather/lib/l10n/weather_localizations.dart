import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'weather_localizations_en.dart';
import 'weather_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of WeatherLocalizations
/// returned by `WeatherLocalizations.of(context)`.
///
/// Applications need to include `WeatherLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/weather_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: WeatherLocalizations.localizationsDelegates,
///   supportedLocales: WeatherLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the WeatherLocalizations.supportedLocales
/// property.
abstract class WeatherLocalizations {
  WeatherLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static WeatherLocalizations? of(BuildContext context) {
    return Localizations.of<WeatherLocalizations>(
      context,
      WeatherLocalizations,
    );
  }

  static const LocalizationsDelegate<WeatherLocalizations> delegate =
      _WeatherLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ja'),
    Locale('en'),
  ];

  /// No description provided for @weather_appTitle.
  ///
  /// In en, this message translates to:
  /// **'PoyoPoyo Weather'**
  String get weather_appTitle;

  /// No description provided for @weather_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get weather_settings;

  /// No description provided for @weather_theme_setting.
  ///
  /// In en, this message translates to:
  /// **'🌗 Theme Setting'**
  String get weather_theme_setting;

  /// No description provided for @weather_language_setting.
  ///
  /// In en, this message translates to:
  /// **'🌐 Language Setting'**
  String get weather_language_setting;

  /// No description provided for @weather_light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get weather_light;

  /// No description provided for @weather_dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get weather_dark;

  /// No description provided for @weather_japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get weather_japanese;

  /// No description provided for @weather_english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get weather_english;

  /// No description provided for @weather_errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out'**
  String get weather_errorTimeout;

  /// No description provided for @weather_errorServer.
  ///
  /// In en, this message translates to:
  /// **'Server error occurred'**
  String get weather_errorServer;

  /// No description provided for @weather_errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred'**
  String get weather_errorUnknown;

  /// No description provided for @weather_cityNotFound.
  ///
  /// In en, this message translates to:
  /// **'City not found'**
  String get weather_cityNotFound;

  /// No description provided for @weather_searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search city'**
  String get weather_searchHint;

  /// No description provided for @weather_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get weather_cancel;

  /// No description provided for @weather_dataNotFound.
  ///
  /// In en, this message translates to:
  /// **'No data found'**
  String get weather_dataNotFound;

  /// No description provided for @weather_fiveDayForecast.
  ///
  /// In en, this message translates to:
  /// **'5-day forecast'**
  String get weather_fiveDayForecast;

  /// Display high and low temperature
  ///
  /// In en, this message translates to:
  /// **'High {max}° Low {min}°'**
  String weather_tempHighLow(String max, String min);
}

class _WeatherLocalizationsDelegate
    extends LocalizationsDelegate<WeatherLocalizations> {
  const _WeatherLocalizationsDelegate();

  @override
  Future<WeatherLocalizations> load(Locale locale) {
    return SynchronousFuture<WeatherLocalizations>(
      lookupWeatherLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_WeatherLocalizationsDelegate old) => false;
}

WeatherLocalizations lookupWeatherLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return WeatherLocalizationsEn();
    case 'ja':
      return WeatherLocalizationsJa();
  }

  throw FlutterError(
    'WeatherLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
