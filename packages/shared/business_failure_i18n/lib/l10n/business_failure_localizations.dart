import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'business_failure_localizations_en.dart';
import 'business_failure_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of BusinessFailureLocalizations
/// returned by `BusinessFailureLocalizations.of(context)`.
///
/// Applications need to include `BusinessFailureLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/business_failure_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: BusinessFailureLocalizations.localizationsDelegates,
///   supportedLocales: BusinessFailureLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the BusinessFailureLocalizations.supportedLocales
/// property.
abstract class BusinessFailureLocalizations {
  BusinessFailureLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static BusinessFailureLocalizations? of(BuildContext context) {
    return Localizations.of<BusinessFailureLocalizations>(
        context, BusinessFailureLocalizations);
  }

  static const LocalizationsDelegate<BusinessFailureLocalizations> delegate =
      _BusinessFailureLocalizationsDelegate();

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
    Locale('en')
  ];

  /// No description provided for @biz_unknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again later. (Code: {code})'**
  String biz_unknown(String code);

  /// No description provided for @biz_rate_limited.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again later.'**
  String get biz_rate_limited;

  /// No description provided for @biz_maintenance.
  ///
  /// In en, this message translates to:
  /// **'The service is under maintenance. Please try again later.'**
  String get biz_maintenance;

  /// No description provided for @biz_service_busy.
  ///
  /// In en, this message translates to:
  /// **'The service is busy. Please retry in a moment.'**
  String get biz_service_busy;
}

class _BusinessFailureLocalizationsDelegate
    extends LocalizationsDelegate<BusinessFailureLocalizations> {
  const _BusinessFailureLocalizationsDelegate();

  @override
  Future<BusinessFailureLocalizations> load(Locale locale) {
    return SynchronousFuture<BusinessFailureLocalizations>(
        lookupBusinessFailureLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_BusinessFailureLocalizationsDelegate old) => false;
}

BusinessFailureLocalizations lookupBusinessFailureLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return BusinessFailureLocalizationsEn();
    case 'ja':
      return BusinessFailureLocalizationsJa();
  }

  throw FlutterError(
      'BusinessFailureLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
