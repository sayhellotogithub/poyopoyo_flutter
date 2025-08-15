// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/15
// Description: 
// -------------------------------------------------------------------
import 'package:flutter/widgets.dart';

import 'failure_messages_en.dart';
import 'failure_messages_ja.dart';
import 'failure_messages_zh.dart';

class FailureLocalizer {
  final Locale locale;
  FailureLocalizer(this.locale);

  String localize(String code, {String? fallback}) {
    final lang = locale.languageCode;
    switch (lang) {
      case 'ja':
        return failureMessagesJa[code] ?? failureMessagesEn[code] ?? fallback ?? code;
      case 'zh':
        return failureMessagesZh[code] ?? failureMessagesEn[code] ?? fallback ?? code;
      default:
        return failureMessagesEn[code] ?? fallback ?? code;
    }
  }

  static FailureLocalizer of(BuildContext context) {
    return FailureLocalizer(Localizations.localeOf(context));
  }
}
