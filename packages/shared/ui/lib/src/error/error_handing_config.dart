// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';

import '../../l10n/ui_localizations.dart';
import '../widgets/dialog/dialog_dedup_config.dart';
import '../widgets/dialog/dialog_skin.dart';
import '../widgets/dialog/dialog_texts.dart';

class ErrorHandlingConfig {
  final DialogSkin dialogSkin;
  final DialogTextsResolver textsResolver;
  final DialogDedupConfig dedupConfig;
  final Duration snackBarDuration;
  final SnackBarBehavior snackBarBehavior;

  const ErrorHandlingConfig({
    required this.dialogSkin,
    required this.textsResolver,
    this.dedupConfig = const DialogDedupConfig(
      window: Duration(seconds: 3),
    ),
    this.snackBarDuration = const Duration(seconds: 4),
    this.snackBarBehavior = SnackBarBehavior.floating,
  });

  factory ErrorHandlingConfig.business() {
    return ErrorHandlingConfig(
      dialogSkin: DialogSkin.business(),
      textsResolver: (context) {
        final l10n = UILocalizations.of(context)!;
        return DialogTexts(
          title: l10n.dialog_error_title,
          close: l10n.dialog_close,
          retry: l10n.dialog_retry,
          showDetails: l10n.dialog_show_details,
          hideDetails: l10n.dialog_hide_details,
          copy: l10n.dialog_copy,
          copySuccess: l10n.dialog_copy_success,
          copyError: l10n.dialog_copy_error,
        );
      },
    );
  }
}
