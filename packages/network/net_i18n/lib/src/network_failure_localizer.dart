// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

import '../l10n/network_failure_localizations.dart';

class NetworkI18nConfig {
  final Map<NetErrCode, String Function(NetworkFailureLocalizations, int?)>
      codeOverrides;
  final Map<int, String Function(NetworkFailureLocalizations)>
      httpStatusOverrides; // Specific HTTP
  const NetworkI18nConfig({
    this.codeOverrides = const {},
    this.httpStatusOverrides = const {},
  });
}

class NetworkFailureLocalizer {
  final NetworkI18nConfig config;

  const NetworkFailureLocalizer({this.config = const NetworkI18nConfig()});

  String localize(BuildContext context, NetworkFailure f) {
    final locale = NetworkFailureLocalizations.of(context)!;
    final info = f.info;

    // 1) Specific HTTP status overrides
    if (info.httpStatus != null) {
      final ov = config.httpStatusOverrides[info.httpStatus!];
      if (ov != null) return ov(locale);
    }
    // 2) Code-level overwrite
    final ov2 = config.codeOverrides[info.code];
    if (ov2 != null) return ov2(locale, info.httpStatus);

    // 3) Default Mapping
    switch (info.code) {
      case NetErrCode.offline:
        return locale.net_offline;
      case NetErrCode.timeout:
        return locale.net_timeout;
      case NetErrCode.cancelled:
        return locale.net_cancelled;
      case NetErrCode.tls:
        return locale.net_tls;
      case NetErrCode.dns:
        return locale.net_dns;
      case NetErrCode.unauthorized:
        return locale.http_401;
      case NetErrCode.httpRetryable:
        return locale.http_retryable(info.httpStatus ?? 0);
      case NetErrCode.httpOther:
        return locale.http_other(info.httpStatus ?? 0);
      case NetErrCode.unknown:
        return locale.net_unknown;
      case NetErrCode.badResponse:
        return locale.net_bad_response;
      case NetErrCode.tooManyRequests:
        return locale.http_429;
      case NetErrCode.notFound:
        return locale.http_404;
      case NetErrCode.forbidden:
        return locale.http_403;
      default:
        return locale.net_unknown;
    }
  }
}
