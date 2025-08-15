// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';

// 指数退避，遇到网络/5xx重试
class RetryInterceptor extends Interceptor {
  final int maxAttempts;

  RetryInterceptor({this.maxAttempts = 2});

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final req = err.requestOptions;
    final retried = (req.extra['retry'] as int?) ?? 0;

    final isRetryable = err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.receiveTimeout ||
        (err.response?.statusCode ?? 0) >= 500;

    if (isRetryable && retried < maxAttempts) {
      await Future.delayed(Duration(milliseconds: 300 * (retried + 1)));
      req.extra['retry'] = retried + 1;
      final dio = err.requestOptions;
      final _client = err.requestOptions; // 占位：实际需拿到 dio 实例
      // 这里建议封装到 client 内部，持有 dio 实例并执行重试
    }
    handler.next(err);
  }
}
