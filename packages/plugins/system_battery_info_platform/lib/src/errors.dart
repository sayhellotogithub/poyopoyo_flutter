// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/07
// Description: 全プラットフォーム共通のエラーコード／例外
// -------------------------------------------------------------------
class BatteryInfoErrorCodes {
  static const String permissionDenied = 'ERR_PERMISSION_DENIED';
  static const String unavailable = 'ERR_UNAVAILABLE';
}

class BatteryInfoException implements Exception {
  final String code;
  final String message;
  final dynamic details;

  BatteryInfoException(this.code, this.message, [this.details]);

  @override
  String toString() => 'BatteryInfoException($code, $message)';
}
