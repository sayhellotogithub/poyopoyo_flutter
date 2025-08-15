// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:network_core/core.dart';

import 'envelope_classifier.dart';

/// 把 NetResult<ResponseBody> -> AppResult<T>
/// 约定：200 且 success=true => 成功
/// 200 且 success=false => BizFailure
/// 非 2xx => 仍优先当 NetHttpError，但若 body 有 code/message，可升格为 BizFailure（视后端规范）
AppResult<T> decodeEnvelopeBytes<T>(
  NetResult<NetResponseBody> res,
  T Function(Map<String, dynamic> json) fromData,
) {
  return res.fold(
    (ok) {
      final status = ok.status; // 如果你的类型是 statusCode，请改这里
      dynamic body;
      try {
        body = jsonDecode(utf8.decode(ok.bytes));
      } catch (_) {
        body = null;
      }
      return classifyEnvelope<T>(
        status,
        body,
        mapData: (j) => fromData(Map<String, dynamic>.from(j as Map)),
      );
    },
    (e) => Err<T, Failure>(NetworkFailure(e)),
  );
}

AppResult<T> decodeEnvelopeBody<T>(
  NetResult<NetResponseBody> res,
  T Function(Map<String, dynamic> json) fromData,
) {
  return res.fold(
    (ok) => classifyEnvelope<T>(
      ok.status,
      ok.bytes,
      mapData: (j) => fromData(Map<String, dynamic>.from(j as Map)),
    ),
    (e) => Err<T, Failure>(NetworkFailure(e)),
  );
}
