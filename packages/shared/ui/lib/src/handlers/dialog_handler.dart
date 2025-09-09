// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';

import '../widgets/dialog/dialog_dedup_config.dart';
import '../widgets/dialog/dialog_skin.dart';
import '../widgets/dialog/dialog_texts.dart';
import '../widgets/dialog/error_dialog_body.dart';

Future<void> dialogHandler(
  BuildContext context,
  String message, {
  VoidCallback? onRetry,
  Map<String, String>? details,
  DialogSkin? skin,
  DialogTextsResolver textsResolver = defaultTextsResolver,
  DialogDedupConfig dedup = const DialogDedupConfig(),
}) async {
  final s = skin ?? DialogSkin.business();
  final hasDetails = (details != null && details.isNotEmpty);
  final key = dedup.keyBuilder(
    message: message,
    hasRetry: onRetry != null,
    hasDetails: hasDetails,
  );
  if (!_dialogDeduper.shouldShow(key, dedup.window)) return;

  await showDialog<void>(
    context: context,
    barrierDismissible: s.barrierDismissible,
    builder: (_) => Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: s.maxWidth),
        child: ErrorDialogBody(
          message: message,
          onRetry: onRetry,
          details: details,
          skin: s,
          texts: textsResolver(context),
        ),
      ),
    ),
  );
}

class _DialogDeduper {
  String? _lastKey;
  DateTime _lastAt = DateTime.fromMillisecondsSinceEpoch(0);

  bool shouldShow(String key, Duration window) {
    final now = DateTime.now();
    if (_lastKey == key && now.difference(_lastAt) < window) return false;
    _lastKey = key;
    _lastAt = now;
    return true;
  }
}

final _dialogDeduper = _DialogDeduper();
