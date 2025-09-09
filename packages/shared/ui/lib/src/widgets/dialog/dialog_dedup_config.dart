// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
typedef DialogDedupKeyBuilder = String Function({
  required String message,
  required bool hasRetry,
  required bool hasDetails,
});

class DialogDedupConfig {
  final Duration window;
  final DialogDedupKeyBuilder keyBuilder;

  const DialogDedupConfig({
    this.window = const Duration(seconds: 2),
    this.keyBuilder = _defaultKeyBuilder,
  });

  static String _defaultKeyBuilder({
    required String message,
    required bool hasRetry,
    required bool hasDetails,
  }) =>
      '$message|$hasRetry|$hasDetails';
}
