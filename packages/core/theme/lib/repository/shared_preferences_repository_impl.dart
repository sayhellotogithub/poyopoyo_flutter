// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/08
// Description:
// -------------------------------------------------------------------
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme/repository/shared_preferences_repository.dart';
import 'package:theme/theme_mapper.dart';


class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  static const _key = 'theme_mode';

  @override
  Future<void> saveAppThemeMode(AppThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, mode.code);
  }

  @override
  Future<AppThemeMode?> fetchAppThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getInt(_key);
    return AppThemeModeMapper.fromCode(value ?? -1);
  }
}
