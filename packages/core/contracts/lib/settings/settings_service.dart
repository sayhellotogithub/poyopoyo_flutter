// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description: 
// -------------------------------------------------------------------
abstract class SettingsService {
  Future<void> setLanguageCode(String code);
  Future<String?> getLanguageCode();
}