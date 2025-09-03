// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/14
// Description:
// -------------------------------------------------------------------
enum ErrorAction {
  retry,
  reauth,
  showForm,
  require3DS,
  showDialog,
  showToast,
  navigateKyc,
  none
}

enum DecisionReason {
  notFailure, //The input parameter is not Failure
  networkTimeoutOrOffline, //Timeout/Offline
  networkUnauthorized, //401/Credentials Expired
  networkRetryableStatus, //5xx/429 etc. can be retried
  codeOverride, //Code-level coverage
  directCodeMap, //Code-level direct mapping
  retryableByBizRule, //Business rule judgment can be retried
  categoryOverride, //Category Coverage
  categoryDefault, //Category Default
  fallback,
}

class ActionDecision {
  final ErrorAction action;
  final DecisionReason reason;
  final String? code;
  final int? httpStatus;

  const ActionDecision(this.action, this.reason, {this.code, this.httpStatus});

  @override
  String toString() {
    return 'ActionDecision(action: $action, reason: $reason, code: $code, httpStatus: $httpStatus)';
  }
}
