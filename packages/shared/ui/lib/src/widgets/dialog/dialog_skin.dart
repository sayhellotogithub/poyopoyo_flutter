// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description: 
// -------------------------------------------------------------------
import 'package:flutter/material.dart';

class DialogSkin {
  final double maxWidth;
  final ShapeBorder shape;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry actionsPadding;
  final bool barrierDismissible;

  const DialogSkin({
    this.maxWidth = 520,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    this.contentPadding = const EdgeInsets.fromLTRB(16, 8, 16, 0),
    this.actionsPadding = const EdgeInsets.fromLTRB(16, 0, 16, 12),
    this.barrierDismissible = true,
  });

  factory DialogSkin.business() => const DialogSkin();
}