// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AuthLocalizationsEn extends AuthLocalizations {
  AuthLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get auth_token_expired =>
      'Your session has expired. Please sign in again.';

  @override
  String get auth_kyc_required =>
      'Please complete identity verification (KYC).';

  @override
  String auth_user_blocked(int days) {
    return 'Your account is suspended for $days day(s).';
  }
}
