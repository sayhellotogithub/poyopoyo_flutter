// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/08
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF2F80ED),
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xFF212121),
      elevation: 1,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF212121)),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF2F80ED),
    scaffoldBackgroundColor: const Color(0xFF1F1F1F),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF2C2C2C),
      foregroundColor: Colors.white,
      elevation: 1,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFE0E0E0)),
    ),
  );
}
