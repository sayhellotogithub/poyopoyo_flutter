// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'network_failure_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class NetworkFailureLocalizationsJa extends NetworkFailureLocalizations {
  NetworkFailureLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get net_timeout => 'タイムアウトしました。';

  @override
  String get net_offline => 'インターネットに接続されていません。';

  @override
  String get net_cancelled => 'リクエストはキャンセルされました。';

  @override
  String get net_tls => 'セキュア接続に失敗しました。';

  @override
  String get net_dns => 'DNS の解決に失敗しました。';

  @override
  String get net_bad_response => 'サーバーから不正な応答が返されました。';

  @override
  String get net_unknown => '不明なネットワークエラーが発生しました。';

  @override
  String get http_401 => '未認証です。もう一度サインインしてください。';

  @override
  String get http_403 => 'アクセスが拒否されました。権限がありません。';

  @override
  String get http_404 => 'リソースが見つかりません。';

  @override
  String get http_429 => 'リクエストが多すぎます。しばらくしてからお試しください。';

  @override
  String http_retryable(int code) {
    return '一時的な問題が発生しました（HTTP $code）。再試行してください。';
  }

  @override
  String http_other(int code) {
    return 'リクエストに失敗しました（HTTP $code）。';
  }
}
