// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'business_failure_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class BusinessFailureLocalizationsJa extends BusinessFailureLocalizations {
  BusinessFailureLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String biz_unknown(String code) {
    return 'エラーが発生しました。しばらくしてからお試しください。（コード: $code）';
  }

  @override
  String get biz_rate_limited => 'リクエストが多すぎます。しばらくしてからもう一度お試しください。.';

  @override
  String get biz_maintenance => 'サービスはメンテナンス中です。しばらくしてからもう一度お試しください。';

  @override
  String get biz_service_busy => 'サービスはビジー状態です。しばらくしてからもう一度お試しください。';
}
