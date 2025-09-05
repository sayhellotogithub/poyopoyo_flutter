// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
enum NetErrCode {
  offline,        // 无网络/连接失败
  timeout,        // 超时
  cancelled,      // 请求取消
  tls,            // TLS/证书错误
  dns,            // DNS 解析失败

  unauthorized,   // 401 未授权（含凭证过期）
  forbidden,      // 403 权限不足
  notFound,       // 404 资源不存在
  tooManyRequests,// 429
  httpRetryable,  // 5xx （可重试）
  httpOther,      // 其它非成功 HTTP

  badResponse,    // 有响应，但 body/格式解析失败
  unknown,        // 未识别
}

/// 标准化后的网络错误信息（含可选的HTTP状态码）
class NetErrInfo {
  final NetErrCode code;
  final int? httpStatus;

  const NetErrInfo(this.code, {this.httpStatus});
}
