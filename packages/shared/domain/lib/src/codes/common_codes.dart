// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/13
// Description:
// -------------------------------------------------------------------



import 'package:action_policy/action_policy.dart';

class CommonCodes {
  static const String businessError = 'BUSINESS_ERROR';
  static const String malformedData = 'MALFORMED_DATA';
  static const String validation = 'VALIDATION_FAILED';
  static const String conflict = 'CONFLICT';
  static const String notFound = 'NOT_FOUND';
  static const String rateLimited = 'RATE_LIMITED';
  static const String serverBusy = 'SERVER_BUSY';
  static const String maintenance = 'MAINTENANCE';
  static const String unknown = 'UNKNOWN';
  static const String unauthorized = 'AUTH_UNAUTHORIZED';


  // —— 别名大表（合并各域）——
  static final Map<String, String> _aliases = {
    // 通用
    'VALIDATION_ERROR': validation,
    '422': validation,
    '409': conflict,
    '404': notFound,
    '429': rateLimited,
    'SERVER_BUSY': serverBusy,
    'MAINTAINING': maintenance,

    // // 各领域（展开引入）
    // ...kAuthAliases,
  };

  /// 根据 HTTP 状态提供默认业务码（当后端没给 code 时）
  static String? fromHttpStatus(int status) {
    return switch (status) {
      401 => unauthorized,
      404 => notFound,
      409 => conflict,
      422 => validation,
      429 => rateLimited,
      503 => serverBusy,
      _ => null,
    };
  }

  static String normalize(String? raw, {int? httpStatus}) {
    if (raw == null || raw.isEmpty) {
      return fromHttpStatus(httpStatus ?? 0) ?? businessError;
    }
    var key = raw.trim();
    // 常见前缀清理（可按需扩展）
    if (RegExp(r'^(ERR_|ERROR_|E)[0-9]{3,5}\$').hasMatch(key.toUpperCase())) {
      // 形如 E40101 → 映射到 40101，再走别名
      key = key.toUpperCase().replaceAll(RegExp(r'^(ERR_|ERROR_|E)'), '');
    }
    key = key.toUpperCase().replaceAll('-', '_');
    return _aliases[key] ?? key;
  }

  /// 分类：返回该 code 的业务类别
  static BizCategory categoryOf(String code) {
    final c = code.toUpperCase();
    // if ({
    //   AuthCodes.unauthorized,
    //   AuthCodes.invalidCredentials,
    //   AuthCodes.accountLocked,
    //   AuthCodes.passwordExpired,
    //   AuthCodes.tokenExpired,
    //   AuthCodes.refreshExpired,
    //   AuthCodes.tokenRevoked,
    //   AuthCodes.invalidClient,
    //   AuthCodes.invalidGrant,
    //   AuthCodes.invalidScope,
    //   AuthCodes.accessDenied,
    //   AuthCodes.consentRequired,
    //   AuthCodes.mfaRequired,
    //   AuthCodes.kycRequired,
    // }.contains(c)) return BizCategory.auth;

    return BizCategory.general;
  }

  /// 是否建议重试（网络/后端压力/配额类）
  static bool isRetryable(String code) {
    final c = code.toUpperCase();
    return {
      rateLimited,
      serverBusy,
    }.contains(c);
  }
}
