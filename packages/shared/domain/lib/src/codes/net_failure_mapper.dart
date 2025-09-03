// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
import 'package:network_core/core.dart';

import 'network_error_codes.dart';

NetErrInfo mapNetFailure(NetFailure e,
    {Set<int> retryableStatuses = const {429, 502, 503, 504}}) {
  if (e is NetTimeout) return const NetErrInfo(NetErrCode.timeout);
  if (e is NetNoConnection) return const NetErrInfo(NetErrCode.offline);
  // if (e is NetCancelled)     return const NetErrInfo(NetErrCode.cancelled);
  // if (e is NetTlsError)      return const NetErrInfo(NetErrCode.tls);
  // if (e is NetDnsError)      return const NetErrInfo(NetErrCode.dns);
  if (e is NetUnauthorized) return const NetErrInfo(NetErrCode.unauthorized);
  if (e is NetHttpError) {
    final st = e.status;
    return retryableStatuses.contains(st)
        ? NetErrInfo(NetErrCode.httpRetryable, httpStatus: st)
        : NetErrInfo(NetErrCode.httpOther, httpStatus: st);
  }
  return const NetErrInfo(NetErrCode.unknown);
}
