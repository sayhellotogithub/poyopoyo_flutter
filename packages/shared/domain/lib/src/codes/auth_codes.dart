// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/13
// Description:
// -------------------------------------------------------------------
class AuthCodes {
  // 基础鉴权
  static const String unauthorized = 'AUTH_UNAUTHORIZED'; // 未登录/未携带凭证
  static const String invalidCredentials =
      'AUTH_INVALID_CREDENTIALS'; // 账号或密码错误
  static const String accountLocked = 'AUTH_ACCOUNT_LOCKED'; // 账户被锁定
  static const String passwordExpired = 'AUTH_PASSWORD_EXPIRED';

  // Token/会话
  static const String tokenExpired = 'AUTH_TOKEN_EXPIRED';
  static const String refreshExpired = 'AUTH_REFRESH_EXPIRED';
  static const String tokenRevoked = 'AUTH_TOKEN_REVOKED';

  // OAuth / OIDC
  static const String invalidClient = 'AUTH_INVALID_CLIENT';
  static const String invalidGrant = 'AUTH_INVALID_GRANT';
  static const String invalidScope = 'AUTH_INVALID_SCOPE';
  static const String accessDenied = 'AUTH_ACCESS_DENIED';
  static const String consentRequired = 'AUTH_CONSENT_REQUIRED';

  // 安全增强
  static const String mfaRequired = 'AUTH_MFA_REQUIRED';
  static const String kycRequired = 'AUTH_KYC_REQUIRED';
}

/// OAuth/OIDC & 服务端常见别名 → 标准码
const Map<String, String> kAuthAliases = {
  // HTTP/服务端常见
  'UNAUTHORIZED': AuthCodes.unauthorized,
  '401': AuthCodes.unauthorized,
  'TOKEN_EXPIRED': AuthCodes.tokenExpired,
  '40101': AuthCodes.tokenExpired,
  'E40101': AuthCodes.tokenExpired,
  'REFRESH_EXPIRED': AuthCodes.refreshExpired,
  'TOKEN_REVOKED': AuthCodes.tokenRevoked,
  'ACCOUNT_LOCKED': AuthCodes.accountLocked,
  'PASSWORD_EXPIRED': AuthCodes.passwordExpired,

  // OAuth 标准
  'INVALID_CLIENT': AuthCodes.invalidClient,
  'INVALID_GRANT': AuthCodes.invalidGrant,
  'INVALID_SCOPE': AuthCodes.invalidScope,
  'ACCESS_DENIED': AuthCodes.accessDenied,
  'CONSENT_REQUIRED': AuthCodes.consentRequired,

  // 安全增强
  'MFA_REQUIRED': AuthCodes.mfaRequired,
  'KYC_REQUIRED': AuthCodes.kycRequired,
};
