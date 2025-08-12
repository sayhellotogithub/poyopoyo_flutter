// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:network_core/core.dart';

import 'model/token_provider.dart';

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
        bytes: _asBytes(resp.data),
      ));
    } on DioException catch (e) {
      return Err(_mapDioError(e));
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

  NetFailure _mapDioError(DioException e) {
    if (e.type == DioExceptionType.cancel) return NetCanceled();
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return NetTimeout();
    }
    if (e.type == DioExceptionType.badResponse) {
      final status = e.response?.statusCode ?? 0;
      if (status == 0) return NetUnknown(e);
      if (status == 401) return NetUnauthorized();
      return NetHttpError(status, message: e.response?.data?.toString());
    }
    if (e.error is SocketException) return NetNoConnection();
    return NetUnknown(e);
  }

  Uint8List _asBytes(dynamic data) {
    if (data is Uint8List) return data;
    if (data is String) return Uint8List.fromList(utf8.encode(data));
    return Uint8List.fromList(utf8.encode(jsonEncode(data)));
  }
}
