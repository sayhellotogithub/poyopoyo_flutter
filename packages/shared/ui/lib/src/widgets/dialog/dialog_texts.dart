// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';

typedef DialogTextsResolver = DialogTexts Function(BuildContext ctx);

/// Example: Default Resolver, which can be replaced with your localization as needed (S.of(ctx) etc.)
DialogTexts defaultTextsResolver(BuildContext ctx) => const DialogTexts(
      title: 'エラー',
      close: '閉じる',
      retry: '再試行',
      showDetails: '詳細を表示',
      hideDetails: '詳細を隠す',
    );

class DialogTexts {
  final String title;
  final String close;
  final String retry;
  final String showDetails;
  final String hideDetails;
  final String? copy;
  final String? copySuccess;
  final String? copyError;

  const DialogTexts({
    required this.title,
    required this.close,
    required this.retry,
    required this.showDetails,
    required this.hideDetails,
    this.copy,
    this.copySuccess,
    this.copyError,
  });
}
