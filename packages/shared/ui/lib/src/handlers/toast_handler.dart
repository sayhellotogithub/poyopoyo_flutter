// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:ui/l10n/ui_localizations.dart';

import '../widgets/toast/app_snack_bar.dart';
import '../widgets/toast/snack_severity.dart';

Future<void> toastHandler(
  BuildContext ctx,
  String message, {
  VoidCallback? onRetry,
}) async {
  showAppSnackBar(
    ctx,
    message: message,
    // Here you can switch the severity level according to the business, such as network error = warning, business error = info/error
    severity: SnackSeverity.warning,
    actionLabel: onRetry != null ? UILocalizations.of(ctx)!.ui_retry : null,
    onAction: onRetry,
  );
}
