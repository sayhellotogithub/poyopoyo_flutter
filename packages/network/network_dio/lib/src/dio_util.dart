// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/15
// Description:
// -------------------------------------------------------------------
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:network_core/core.dart';

class DioUtil {
  DioUtil._();

  static NetFailure mapDioError(DioException e) {
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

  static Uint8List asBytes(dynamic data) {
    if (data is Uint8List) return data;
    if (data is String) return Uint8List.fromList(utf8.encode(data));
    return Uint8List.fromList(utf8.encode(jsonEncode(data)));
  }
}
