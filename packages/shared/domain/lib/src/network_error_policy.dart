// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/15
// Description:
// -------------------------------------------------------------------

import 'package:action_policy/action_policy.dart';
import 'package:network_core/core.dart';

import 'codes/network_error_codes.dart';

final class NetworkErrorPolicy {
  static NetworkFailure failure(NetErrCode code) => switch (code) {
        NetErrCode.offline => NetworkFailure(NetNoConnection()),
        NetErrCode.timeout => NetworkFailure(NetTimeout()),
        NetErrCode.cancelled => NetworkFailure(NetCanceled()),
        NetErrCode.tls => NetworkFailure(NetTls()),
        NetErrCode.dns => NetworkFailure(NetDns()),
        NetErrCode.unauthorized => NetworkFailure(NetHttpError(401)),
        NetErrCode.httpRetryable => NetworkFailure(NetHttpError(500)),
        NetErrCode.httpOther => NetworkFailure(NetHttpError(400)),
        NetErrCode.tooManyRequests => NetworkFailure(NetHttpError(429)),
        NetErrCode.notFound => NetworkFailure(NetHttpError(404)),
        NetErrCode.forbidden => NetworkFailure(NetHttpError(403)),
        NetErrCode.badResponse => NetworkFailure(NetHttpError(400)),
        NetErrCode.unknown => NetworkFailure(NetUnknown('Unknown')),
      };

  static ActionDecision decide(NetErrInfo info) => switch (info.code) {
        NetErrCode.offline ||
        NetErrCode.timeout ||
        NetErrCode.cancelled =>
          const ActionDecision(
              ErrorAction.retry, DecisionReason.networkTimeoutOrOffline),
        NetErrCode.unauthorized => const ActionDecision(
            ErrorAction.reauth, DecisionReason.networkUnauthorized),
        NetErrCode.httpRetryable => ActionDecision(
            ErrorAction.retry, DecisionReason.networkRetryableStatus,
            httpStatus: info.httpStatus),
        NetErrCode.tls ||
        NetErrCode.dns ||
        NetErrCode.httpOther ||
        NetErrCode.badResponse ||
        NetErrCode.forbidden ||
        NetErrCode.notFound ||
        NetErrCode.tooManyRequests ||
        NetErrCode.unknown =>
          const ActionDecision(ErrorAction.showDialog, DecisionReason.fallback)
      };
}
