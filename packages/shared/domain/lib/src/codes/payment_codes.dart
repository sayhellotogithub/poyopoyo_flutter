// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/13
// Description: 
// -------------------------------------------------------------------
class PaymentCodes {
  static const String cardDeclined         = 'PAY_CARD_DECLINED';
  static const String insufficientFunds    = 'PAY_INSUFFICIENT_FUNDS';
  static const String threeDSRequired      = 'PAY_3DS_REQUIRED';
  static const String verificationRequired = 'PAY_VERIFICATION_REQUIRED'; // KYC / 绑卡验证等
  static const String duplicateTxn         = 'PAY_DUPLICATE_TXN';
  static const String currencyUnsupported  = 'PAY_CURRENCY_UNSUPPORTED';
  static const String limitExceeded        = 'PAY_LIMIT_EXCEEDED';
  static const String gatewayTimeout       = 'PAY_GATEWAY_TIMEOUT';
  static const String providerDown         = 'PAY_PROVIDER_UNAVAILABLE';
}

/// 常见 PSP/网关别名 → 标准码
const Map<String, String> kPaymentAliases = {
  'CARD_DECLINED': PaymentCodes.cardDeclined,
  'DO_3DS': PaymentCodes.threeDSRequired,
  '3DS_REQUIRED': PaymentCodes.threeDSRequired,
  'VERIFICATION_REQUIRED': PaymentCodes.verificationRequired,
  'INSUFFICIENT_FUNDS': PaymentCodes.insufficientFunds,
  'DUPLICATE': PaymentCodes.duplicateTxn,
  'CURRENCY_NOT_SUPPORTED': PaymentCodes.currencyUnsupported,
  'LIMIT_EXCEEDED': PaymentCodes.limitExceeded,
  'GATEWAY_TIMEOUT': PaymentCodes.gatewayTimeout,
  'PROVIDER_UNAVAILABLE': PaymentCodes.providerDown,
};