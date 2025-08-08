// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/08
// Description: 
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:theme/theme_mapper.dart';


abstract class SharedPreferencesRepository {
  Future<void> saveAppThemeMode(AppThemeMode mode);
  Future<AppThemeMode?> fetchAppThemeMode();
}
