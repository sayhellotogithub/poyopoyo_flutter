// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/14
// Description:
// -------------------------------------------------------------------

import 'package:domain/src/codes/payment_codes.dart';

import 'auth_codes.dart';
import 'biz_codes.dart';
import 'error_action_types.dart';

const Set<int> kDefaultRetryableHttpStatuses = {429, 502, 503, 504};

const Map<String, ErrorAction> kDirectCodeActions = {
  // Auth
  AuthCodes.invalidCredentials: ErrorAction.showForm,
  AuthCodes.tokenExpired: ErrorAction.reauth,
  AuthCodes.tokenRevoked: ErrorAction.reauth,
  AuthCodes.unauthorized: ErrorAction.reauth,

  // Payment
  PaymentCodes.threeDSRequired: ErrorAction.require3DS,
  PaymentCodes.providerDown: ErrorAction.retry,
  PaymentCodes.gatewayTimeout: ErrorAction.retry,
  PaymentCodes.cardDeclined: ErrorAction.showForm,
  PaymentCodes.insufficientFunds: ErrorAction.showForm,
  PaymentCodes.currencyUnsupported: ErrorAction.showForm,
  PaymentCodes.limitExceeded: ErrorAction.showForm,

  // General（示例）
  BizCodes.serverBusy: ErrorAction.retry,
  BizCodes.rateLimited: ErrorAction.retry,
};
const Map<BizCategory, ErrorAction> kCategoryDefaults = {
  BizCategory.auth: ErrorAction.reauth,
  BizCategory.payment: ErrorAction.showDialog,
  BizCategory.general: ErrorAction.showDialog,
};

class ErrorActionOverrides {
  final Map<String, ErrorAction> codeOverrides;
  final Map<BizCategory, ErrorAction> categoryOverrides;

  const ErrorActionOverrides({
    this.codeOverrides = const {},
    this.categoryOverrides = const {},
  });
}
