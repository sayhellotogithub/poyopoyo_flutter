// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:ui/src/widgets/toast/snack_severity.dart';

import 'snack_theme.dart';

SnackBar buildAppSnackBar(
  BuildContext ctx, {
  required String message,
  SnackSeverity severity = SnackSeverity.info,
  String? actionLabel,
  VoidCallback? onAction,
  SnackTheme? theme,
}) {
  final t = theme ?? SnackTheme.business(ctx);
  final text = Text(
    message,
    maxLines: 5,
    overflow: TextOverflow.ellipsis,
  );

  final content = Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(t.icon[severity], size: 20),
      const SizedBox(width: 10),
      Expanded(child: text),
    ],
  );

  final bar = SnackBar(
    behavior: t.floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    duration: t.duration,
    dismissDirection: DismissDirection.horizontal,
    backgroundColor: t.bg[severity],
    shape: t.shape,
    content: LayoutBuilder(
      builder: (context, constraints) {
        // Large screen center narrowing
        final isWide = constraints.maxWidth > t.maxWidth;
        final inner = Padding(padding: t.padding, child: content);
        return isWide
            ? Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: t.maxWidth),
                  child: inner,
                ),
              )
            : inner;
      },
    ),
    action: (onAction != null && (actionLabel ?? '').isNotEmpty)
        ? SnackBarAction(
            label: actionLabel!,
            onPressed: onAction,
          )
        : null,
  );
  return bar;
}

void showAppSnackBar(
  BuildContext ctx, {
  required String message,
  SnackSeverity severity = SnackSeverity.info,
  String? actionLabel,
  VoidCallback? onAction,
  SnackTheme? theme,
  bool dedupe = true,
}) {
  final key = '$severity::$message::${actionLabel ?? ''}::${onAction != null}';
  if (dedupe && !_snackDeduper.shouldShow(key)) return;

  final bar = buildAppSnackBar(
    ctx,
    message: message,
    severity: severity,
    actionLabel: actionLabel,
    onAction: onAction,
    theme: theme,
  );
  final messenger = ScaffoldMessenger.maybeOf(ctx);
  if (messenger == null) return;
  messenger
    ..clearSnackBars()
    ..showSnackBar(bar);
}

class _SnackDeduper {
  String? _lastKey;
  DateTime _lastAt = DateTime.fromMillisecondsSinceEpoch(0);

  bool shouldShow(String key, {Duration window = const Duration(seconds: 2)}) {
    final now = DateTime.now();
    if (_lastKey == key && now.difference(_lastAt) < window) return false;
    _lastKey = key;
    _lastAt = now;
    return true;
  }
}

final _snackDeduper = _SnackDeduper();
