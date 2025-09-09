// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'ui_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class UILocalizationsEn extends UILocalizations {
  UILocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get ui_error => 'Error';

  @override
  String get ui_retry => 'Retry';

  @override
  String get ui_ok => 'OK';

  @override
  String get dialog_error_title => 'Error';

  @override
  String get dialog_close => 'Close';

  @override
  String get dialog_retry => 'Retry';

  @override
  String get dialog_show_details => 'Show details';

  @override
  String get dialog_hide_details => 'Hide details';

  @override
  String get dialog_copy => 'Copy';

  @override
  String get dialog_copy_success => 'Copied';

  @override
  String get dialog_copy_error => 'Copy failed';
}
