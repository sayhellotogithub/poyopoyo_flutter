// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'retry.dart';

class Request {
  final HttpMethod method;
  final Uri uri;
  final Map<String, String> headers;
  final Object? body; // 可扩展：json, bytes, form
  final Duration? timeout;
  final bool authenticated; // 交给实现层决定是否带token
  final RetryPolicy? retry;

  const Request({
    required this.method,
    required this.uri,
    this.headers = const {},
    this.body,
    this.timeout,
    this.authenticated = false,
    this.retry,
  });
}

enum HttpMethod { get, post, put, patch, delete }
