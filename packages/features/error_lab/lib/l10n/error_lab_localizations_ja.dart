// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'error_lab_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class ErrorLabLocalizationsJa extends ErrorLabLocalizations {
  ErrorLabLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get error_lab_net_error_code => 'NetErrCode リスト';

  @override
  String get error_lab_business_error_code => 'BusinessErrCode リスト';

  @override
  String get error_lab_error_action_retry_test => '再試行テスト';

  @override
  String get error_lab_error_action_reauth_test => '再認証テスト';

  @override
  String get error_lab_error_action_show_form_test => 'フォーム表示テスト';

  @override
  String get error_lab_error_action_require_3ds_test => '3DS 必須テスト';

  @override
  String get error_lab_error_action_show_dialog_test => 'ダイアログ表示テスト';

  @override
  String get error_lab_error_action_show_toast_test => 'トースト表示テスト';

  @override
  String get error_lab_error_action_navigate_kyc_test => 'KYC 画面遷移テスト';
}
