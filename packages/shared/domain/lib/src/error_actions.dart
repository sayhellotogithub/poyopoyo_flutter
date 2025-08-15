// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/13
// Description:
// -------------------------------------------------------------------
import 'package:domain/src/codes/error_action_maps.dart';
import 'package:domain/src/codes/error_action_types.dart';
import 'package:network_core/core.dart';

import 'failure.dart';
import 'codes/biz_codes.dart';

ActionDecision decideAction(
  Failure f, {
  ErrorActionOverrides overrides = const ErrorActionOverrides(),
  Set<int> retryableStatuses = kDefaultRetryableHttpStatuses,
}) {
  if (f is NetworkFailure) {
    return _decideNetwork(f, retryableStatuses: retryableStatuses);
  }
  if (f is BizFailure) {
    return _decideBiz(f,
        overrides: overrides, retryableStatuses: retryableStatuses);
  }
  return const ActionDecision(ErrorAction.none, DecisionReason.notFailure);
}

ErrorAction actionForFailure(
  Failure f, {
  ErrorActionOverrides overrides = const ErrorActionOverrides(),
  Set<int> retryableStatuses = kDefaultRetryableHttpStatuses,
}) {
  return decideAction(f,
          overrides: overrides, retryableStatuses: retryableStatuses)
      .action;
}

/// 业务错误决策
ActionDecision _decideBiz(
  BizFailure f, {
  required ErrorActionOverrides overrides,
  required Set<int> retryableStatuses,
}) {
  final String code = BizCodes.normalize(f.code, httpStatus: f.httpStatus);
  final BizCategory cat = BizCodes.categoryOf(code);

  // 0) 调用方覆盖（最高优先级）
  final o1 = overrides.codeOverrides[code];
  if (o1 != null) {
    return ActionDecision(o1, DecisionReason.codeOverride,
        code: code, httpStatus: f.httpStatus);
  }

  // 1) 强语义直达（具体标准码）
  final direct = kDirectCodeActions[code];
  if (direct != null) {
    return ActionDecision(direct, DecisionReason.directCodeMap,
        code: code, httpStatus: f.httpStatus);
  }

  // 2) 规则判定为可重试（配额/服务繁忙/网关问题等）
  if (BizCodes.isRetryable(code)) {
    return ActionDecision(ErrorAction.retry, DecisionReason.retryableByBizRule,
        code: code, httpStatus: f.httpStatus);
  }

  // 3) 类别级覆盖
  final o2 = overrides.categoryOverrides[cat];
  if (o2 != null) {
    return ActionDecision(o2, DecisionReason.categoryOverride,
        code: code, httpStatus: f.httpStatus);
  }

  // 4) 类别默认
  final def = kCategoryDefaults[cat];
  if (def != null) {
    return ActionDecision(def, DecisionReason.categoryDefault,
        code: code, httpStatus: f.httpStatus);
  }

  // 5) 兜底
  return ActionDecision(ErrorAction.showDialog, DecisionReason.fallback,
      code: code, httpStatus: f.httpStatus);
}

/// 网络错误决策
ActionDecision _decideNetwork(
  NetworkFailure failure, {
  required Set<int> retryableStatuses,
}) {
  final e = failure.cause;

  if (e is NetTimeout || e is NetNoConnection) {
    return const ActionDecision(
        ErrorAction.retry, DecisionReason.networkTimeoutOrOffline);
  }

  if (e is NetUnauthorized) {
    return const ActionDecision(
        ErrorAction.reauth, DecisionReason.networkUnauthorized);
  }

  if (e is NetHttpError && retryableStatuses.contains(e.status)) {
    return ActionDecision(
      ErrorAction.retry,
      DecisionReason.networkRetryableStatus,
      httpStatus: e.status,
    );
  }

  return const ActionDecision(ErrorAction.showDialog, DecisionReason.fallback);
}

/// 是否应自动重试（保留你原来的语义，但复用决策）
bool shouldAutoRetry(Failure f) => actionForFailure(f) == ErrorAction.retry;

/*
final overrides = ErrorActionOverrides(
  codeOverrides: {
    'PAY_3DS_REQUIRED': ErrorAction.showDialog, // AB：临时改成弹窗
  },
  categoryOverrides: {
    BizCategory.validation: ErrorAction.showDialog, // 临时把表单错误收敛为弹窗
  },
);

final r = await repo.login(...);
r.fold(
  (v) => ...,
  (e) {
    switch (actionForFailure(e, overrides: overrides)) {
      case ErrorAction.reauth: _goLogin(); break;
      case ErrorAction.retry:  _retry(); break;
      case ErrorAction.showForm: _showFormErrors(); break;
      case ErrorAction.require3DS: _start3DS(); break;
      default: _toast(failureMessage(e));
    }
  },
);
*/
