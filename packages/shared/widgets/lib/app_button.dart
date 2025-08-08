// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/08
// Description: 
// -------------------------------------------------------------------
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool primary;

  const AppButton({
    required this.label,
    required this.onPressed,
    this.primary = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return primary
        ? ElevatedButton(onPressed: onPressed, child: Text(label))
        : OutlinedButton(onPressed: onPressed, child: Text(label));
  }
}