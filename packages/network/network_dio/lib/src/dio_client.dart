// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:network_core/core.dart';

import 'dio_util.dart';
import 'model/token_provider.dart';

@deprecated
class DioClient implements INetworkClient {
  final Dio _dio;
  final TokenProvider? _token;

  DioClient(this._dio, {TokenProvider? tokenProvider}) : _token = tokenProvider;

  @override
  Future<Result<NetResponseBody, NetFailure>> send(Request req) async {
    try {
      final options = Options(
        method: req.method.name.toUpperCase(),
        headers: await _buildHeaders(req),
        sendTimeout: req.timeout,
        receiveTimeout: req.timeout,
      );

      final resp = await _dio.requestUri(
        req.uri,
        data: req.body,
        options: options,
      );

      return Ok(NetResponseBody(
        status: resp.statusCode ?? 0,
        headers: resp.headers.map.map((k, v) => MapEntry(k, v.join(','))),
        bytes: DioUtil.asBytes(resp.data),
      ));
    } on DioException catch (e) {
      return Err(DioUtil.mapDioError(e));
    } catch (e) {
      return Err(NetUnknown(e));
    }
  }

  @override
  Stream<Result<StreamEvent, NetFailure>> stream(Request req) async* {
    // SSE/WS 可放到 network_ws，rest模块直接不实现或抛出
    yield Err(NetUnknown(UnsupportedError('Use network_ws for streaming')));
  }

  @override
  void close() => _dio.close(force: true);

  Future<Map<String, String>> _buildHeaders(Request req) async {
    final h = {...req.headers};
    if (req.authenticated && _token != null) {
      final t = await _token.get(); // 自动刷新逻辑在 TokenProvider 内
      if (t != null) h['Authorization'] = 'Bearer $t';
    }
    return h;
  }
}
