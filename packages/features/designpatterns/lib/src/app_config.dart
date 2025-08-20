// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/20
// Description:
// -------------------------------------------------------------------
// class AppConfig {
//   AppConfig._internal();
//
//   static final AppConfig _instance = AppConfig._internal();
//
//   factory AppConfig() => _instance;
//
//   String baseUrl = "https://api.example.com";
// }
class AppConfig {
  AppConfig._internal();

  static AppConfig? _instance;

  factory AppConfig() {
    if (_instance == null) {
      _instance = AppConfig._internal();
    }
    return _instance!;
  }
}
