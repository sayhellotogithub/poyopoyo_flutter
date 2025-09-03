// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'business_failure_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class BusinessFailureLocalizationsEn extends BusinessFailureLocalizations {
  BusinessFailureLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String biz_unknown(String code) {
    return 'Something went wrong. Please try again later. (Code: $code)';
  }

  @override
  String get biz_rate_limited => 'Too many requests. Please try again later.';

  @override
  String get biz_maintenance =>
      'The service is under maintenance. Please try again later.';

  @override
  String get biz_service_busy =>
      'The service is busy. Please retry in a moment.';
}
