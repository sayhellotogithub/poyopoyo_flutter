// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/13
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';

import '../domain.dart';

ActionDecision decideAction(
  Failure failure, {
  ErrorActionOverrides overrides = const ErrorActionOverrides(),
  Set<int> retryableStatuses = kDefaultRetryableHttpStatuses,
  ActionPolicy? policy,
}) {
  if (failure is NetworkFailure) {
    return _decideNetwork(failure, retryableStatuses: retryableStatuses);
  }
  if (failure is BizFailure) {
    return _decideBiz(failure,
        overrides: overrides,
        retryableStatuses: retryableStatuses,
        policy: policy);
  }
  return const ActionDecision(ErrorAction.none, DecisionReason.notFailure);
}

ErrorAction actionForFailure(
  Failure f, {
  ErrorActionOverrides overrides = const ErrorActionOverrides(),
  Set<int> retryableStatuses = kDefaultRetryableHttpStatuses,
  ActionPolicy? policy,
}) {
  return decideAction(f,
          overrides: overrides,
          retryableStatuses: retryableStatuses,
          policy: policy)
      .action;
}

/// 业务错误决策
ActionDecision _decideBiz(
  BizFailure f, {
  required ErrorActionOverrides overrides,
  required Set<int> retryableStatuses,
  ActionPolicy? policy,
}) {
  final String norm = CommonCodes.normalize(f.code, httpStatus: f.httpStatus);
  final BizCategory cat = CommonCodes.categoryOf(norm);

  // 0) 调用方覆盖（最高优先级）
  final o1 = overrides.codeOverrides[norm];
  if (o1 != null) {
    return ActionDecision(o1, DecisionReason.codeOverride,
        code: norm, httpStatus: f.httpStatus);
  }

  if (policy != null) {
    final p = policy.forCode(f.code, f);
    if (p != null) {
      return ActionDecision(p, DecisionReason.directCodeMap,
          code: f.code, httpStatus: f.httpStatus);
    }
  }

  // 1) 强语义直达（具体标准码）
  final direct = kDirectCodeActions[norm];
  if (direct != null) {
    return ActionDecision(direct, DecisionReason.directCodeMap,
        code: norm, httpStatus: f.httpStatus);
  }

  // 2) 规则判定为可重试（配额/服务繁忙/网关问题等）
  if (CommonCodes.isRetryable(norm)) {
    return ActionDecision(ErrorAction.retry, DecisionReason.retryableByBizRule,
        code: norm, httpStatus: f.httpStatus);
  }

  // 3) 类别级覆盖
  final o2 = overrides.categoryOverrides[cat];
  if (o2 != null) {
    return ActionDecision(o2, DecisionReason.categoryOverride,
        code: norm, httpStatus: f.httpStatus);
  }

  // 4) 类别默认
  final def = kCategoryDefaults[cat];
  if (def != null) {
    return ActionDecision(def, DecisionReason.categoryDefault,
        code: norm, httpStatus: f.httpStatus);
  }

  // 5) 兜底
  return ActionDecision(ErrorAction.showDialog, DecisionReason.fallback,
      code: norm, httpStatus: f.httpStatus);
}

/// 网络错误决策
ActionDecision _decideNetwork(
  NetworkFailure failure, {
  required Set<int> retryableStatuses,
}) {
  final info = failure.info;

  switch (info.code) {
    case NetErrCode.timeout:
    case NetErrCode.offline:
    case NetErrCode.cancelled:
      return const ActionDecision(
          ErrorAction.retry, DecisionReason.networkTimeoutOrOffline);

    case NetErrCode.unauthorized:
      return const ActionDecision(
          ErrorAction.reauth, DecisionReason.networkUnauthorized);

    case NetErrCode.httpRetryable:
      return ActionDecision(
          ErrorAction.retry, DecisionReason.networkRetryableStatus,
          httpStatus: info.httpStatus);

    case NetErrCode.tls:
    case NetErrCode.dns:
    case NetErrCode.httpOther:
    case NetErrCode.unknown:
      return const ActionDecision(
          ErrorAction.showDialog, DecisionReason.fallback);
  }
}

/// 是否应自动重试（保留你原来的语义，但复用决策）
bool shouldAutoRetry(Failure f) => actionForFailure(f) == ErrorAction.retry;
