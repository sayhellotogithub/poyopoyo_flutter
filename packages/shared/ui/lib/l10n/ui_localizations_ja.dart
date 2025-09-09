// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ui_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class UILocalizationsJa extends UILocalizations {
  UILocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get ui_error => 'エラー';

  @override
  String get ui_retry => 'リトライ';

  @override
  String get ui_ok => 'オーケー';

  @override
  String get dialog_error_title => 'エラー';

  @override
  String get dialog_close => '閉じる';

  @override
  String get dialog_retry => '再試行';

  @override
  String get dialog_show_details => '詳細を表示';

  @override
  String get dialog_hide_details => '詳細を隠す';

  @override
  String get dialog_copy => 'コピー';

  @override
  String get dialog_copy_success => 'コピーしました';

  @override
  String get dialog_copy_error => 'コピーに失敗しました';
}
