// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/02
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:flutter/material.dart';
import 'package:ui/l10n/ui_localizations.dart';

typedef ShowSnackBar = void Function(BuildContext ctx, String text,
    {VoidCallback? onRetry});
typedef ShowDialogFn = Future<void> Function(BuildContext ctx, String text);
typedef NavigateFn = void Function(BuildContext ctx, String route);

class UnifiedErrorUiConfig {
  final Map<ErrorAction,
          void Function(BuildContext, String, {VoidCallback? onRetry})>
      actionHandlers;
  final NavigateFn navigateToLogin;
  final NavigateFn navigateToKyc;

  const UnifiedErrorUiConfig({
    required this.actionHandlers,
    required this.navigateToLogin,
    required this.navigateToKyc,
  });

  factory UnifiedErrorUiConfig.defaults({
    required ShowSnackBar showSnackBar,
    required ShowDialogFn showDialog,
    required NavigateFn go,
  }) {
    return UnifiedErrorUiConfig(
      actionHandlers: {
        ErrorAction.retry: (c, t, {onRetry}) =>
            showSnackBar(c, t, onRetry: onRetry),
        ErrorAction.showToast: (c, t, {onRetry}) => showSnackBar(c, t),
        ErrorAction.showDialog: (c, t, {onRetry}) => showDialog(c, t),
      },
      navigateToLogin: (c, _) => go(c, '/login'),
      navigateToKyc: (c, _) => go(c, '/kyc'),
    );
  }
}

void defaultShowSnackBar(BuildContext ctx, String msg,
    {VoidCallback? onRetry}) {
  final bar = SnackBar(
    content: Text(msg),
    action: onRetry != null
        ? SnackBarAction(
            label: UILocalizations.of(ctx)!.ui_retry, onPressed: onRetry)
        : null,
  );
  ScaffoldMessenger.of(ctx).showSnackBar(bar);
}

Future<void> defaultShowDialog(BuildContext ctx, String msg) async {
  await showDialog<void>(
    context: ctx,
    builder: (_) => AlertDialog(
      title: Text(UILocalizations.of(ctx)!.ui_error),
      content: Text(msg),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(UILocalizations.of(ctx)!.ui_ok)),
      ],
    ),
  );
}
