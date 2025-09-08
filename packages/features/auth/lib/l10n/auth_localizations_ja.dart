// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AuthLocalizationsJa extends AuthLocalizations {
  AuthLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get auth_token_expired => 'セッションの有効期限が切れました。再度サインインしてください。';

  @override
  String get auth_kyc_required => '本人確認（KYC）を完了してください。';

  @override
  String auth_user_blocked(int days) {
    return 'あなたのアカウントは $days 日間停止されています。';
  }
}
