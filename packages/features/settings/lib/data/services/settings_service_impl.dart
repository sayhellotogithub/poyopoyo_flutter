// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description:
// -------------------------------------------------------------------
import 'package:contracts/settings/settings_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsServiceImpl implements SettingsService {
  static const _languageKey = 'language_code';

  @override
  Future<String?> getLanguageCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey);
  }

  @override
  Future<void> setLanguageCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, code);
  }
}
