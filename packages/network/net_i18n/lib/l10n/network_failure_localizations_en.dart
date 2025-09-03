// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'network_failure_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class NetworkFailureLocalizationsEn extends NetworkFailureLocalizations {
  NetworkFailureLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get net_timeout => 'Connection timed out.';

  @override
  String get net_offline => 'No internet connection.';

  @override
  String get net_cancelled => 'Request was cancelled.';

  @override
  String get net_tls => 'Secure connection failed.';

  @override
  String get net_dns => 'DNS lookup failed.';

  @override
  String get net_bad_response => 'Bad server response.';

  @override
  String get net_unknown => 'An unknown network error occurred.';

  @override
  String get http_401 => 'Unauthorized. Please sign in again.';

  @override
  String get http_403 =>
      'Forbidden. You don\'t have permission to access this resource.';

  @override
  String get http_404 => 'Resource not found.';

  @override
  String get http_429 => 'Too many requests. Please try again later.';

  @override
  String http_retryable(int code) {
    return 'Temporary issue (HTTP $code). Please retry.';
  }

  @override
  String http_other(int code) {
    return 'Request failed (HTTP $code).';
  }
}
