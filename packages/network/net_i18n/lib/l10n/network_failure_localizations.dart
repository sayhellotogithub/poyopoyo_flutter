import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'network_failure_localizations_en.dart';
import 'network_failure_localizations_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of NetworkFailureLocalizations
/// returned by `NetworkFailureLocalizations.of(context)`.
///
/// Applications need to include `NetworkFailureLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/network_failure_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: NetworkFailureLocalizations.localizationsDelegates,
///   supportedLocales: NetworkFailureLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the NetworkFailureLocalizations.supportedLocales
/// property.
abstract class NetworkFailureLocalizations {
  NetworkFailureLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static NetworkFailureLocalizations? of(BuildContext context) {
    return Localizations.of<NetworkFailureLocalizations>(
        context, NetworkFailureLocalizations);
  }

  static const LocalizationsDelegate<NetworkFailureLocalizations> delegate =
      _NetworkFailureLocalizationsDelegate();

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

  /// No description provided for @net_timeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out.'**
  String get net_timeout;

  /// No description provided for @net_offline.
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get net_offline;

  /// No description provided for @net_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Request was cancelled.'**
  String get net_cancelled;

  /// No description provided for @net_tls.
  ///
  /// In en, this message translates to:
  /// **'Secure connection failed.'**
  String get net_tls;

  /// No description provided for @net_dns.
  ///
  /// In en, this message translates to:
  /// **'DNS lookup failed.'**
  String get net_dns;

  /// No description provided for @net_bad_response.
  ///
  /// In en, this message translates to:
  /// **'Bad server response.'**
  String get net_bad_response;

  /// No description provided for @net_unknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown network error occurred.'**
  String get net_unknown;

  /// No description provided for @http_401.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized. Please sign in again.'**
  String get http_401;

  /// No description provided for @http_403.
  ///
  /// In en, this message translates to:
  /// **'Forbidden. You don\'t have permission to access this resource.'**
  String get http_403;

  /// No description provided for @http_404.
  ///
  /// In en, this message translates to:
  /// **'Resource not found.'**
  String get http_404;

  /// No description provided for @http_429.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Please try again later.'**
  String get http_429;

  /// No description provided for @http_retryable.
  ///
  /// In en, this message translates to:
  /// **'Temporary issue (HTTP {code}). Please retry.'**
  String http_retryable(int code);

  /// No description provided for @http_other.
  ///
  /// In en, this message translates to:
  /// **'Request failed (HTTP {code}).'**
  String http_other(int code);
}

class _NetworkFailureLocalizationsDelegate
    extends LocalizationsDelegate<NetworkFailureLocalizations> {
  const _NetworkFailureLocalizationsDelegate();

  @override
  Future<NetworkFailureLocalizations> load(Locale locale) {
    return SynchronousFuture<NetworkFailureLocalizations>(
        lookupNetworkFailureLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_NetworkFailureLocalizationsDelegate old) => false;
}

NetworkFailureLocalizations lookupNetworkFailureLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return NetworkFailureLocalizationsEn();
    case 'ja':
      return NetworkFailureLocalizationsJa();
  }

  throw FlutterError(
      'NetworkFailureLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
