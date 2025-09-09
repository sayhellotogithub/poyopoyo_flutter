// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';

import 'snack_severity.dart';

class SnackTheme {
  final Duration duration;
  final EdgeInsets padding;
  final double
      maxWidth; //Limit width on large screens, ignore on mobile devices
  final ShapeBorder shape;
  final bool floating;
  final Map<SnackSeverity, Color> bg;
  final Map<SnackSeverity, IconData> icon;

  const SnackTheme({
    this.duration = const Duration(seconds: 4),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.maxWidth = 600,
    this.shape = const StadiumBorder(),
    this.floating = true,
    required this.bg,
    required this.icon,
  });

  factory SnackTheme.business(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SnackTheme(
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      floating: true,
      bg: {
        SnackSeverity.info: scheme.surfaceContainerHighest,
        SnackSeverity.warning: scheme.tertiaryContainer,
        SnackSeverity.error: scheme.errorContainer,
        SnackSeverity.success: scheme.primaryContainer,
      },
      icon: {
        SnackSeverity.info: Icons.info_rounded,
        SnackSeverity.warning: Icons.warning_rounded,
        SnackSeverity.error: Icons.error_outline_rounded,
        SnackSeverity.success: Icons.check_circle_rounded,
      },
    );
  }
}
