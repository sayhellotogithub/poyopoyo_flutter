// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/08
// Description: 
// -------------------------------------------------------------------
import '../theme_constants.dart';
import 'package:flutter/material.dart';

enum AppThemeMode {
  dark,
  light,
}

extension AppThemeModeMapper on AppThemeMode {
  int get code => switch (this) {
    AppThemeMode.dark => AppThemeConstants.darkCode,
    AppThemeMode.light => AppThemeConstants.lightCode,
  };

  static AppThemeMode? fromCode(int code) => switch (code) {
    AppThemeConstants.darkCode => AppThemeMode.dark,
    AppThemeConstants.lightCode => AppThemeMode.light,
    _ => null,
  };

  ThemeMode toMaterialTheme() => switch (this) {
    AppThemeMode.dark => ThemeMode.dark,
    AppThemeMode.light => ThemeMode.light,
  };

  static AppThemeMode fromMaterialTheme(ThemeMode mode) => switch (mode) {
    ThemeMode.dark => AppThemeMode.dark,
    _ => AppThemeMode.light,
  };
}