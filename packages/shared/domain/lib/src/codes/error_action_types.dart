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
  none
}

// 动作决策 + 原因，便于埋点、Debug
enum DecisionReason {
  networkTimeoutOrOffline,
  networkUnauthorized,
  networkRetryableStatus,
  codeOverride,
  directCodeMap,
  retryableByBizRule,
  categoryOverride,
  categoryDefault,
  fallback,
  notFailure,
}

class ActionDecision {
  final ErrorAction action;
  final DecisionReason reason;
  final String? code;        // 业务码（已规范化）
  final int? httpStatus;     // HTTP状态
  const ActionDecision(this.action, this.reason, {this.code, this.httpStatus});
}