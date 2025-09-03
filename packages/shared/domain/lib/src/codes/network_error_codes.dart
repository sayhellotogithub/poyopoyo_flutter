// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description: 
// -------------------------------------------------------------------
// 领域侧的“标准网络错误码”，与具体实现(Dio/HttpClient)解耦
enum NetErrCode {
  offline,      // 无网络/连接失败
  timeout,      // 连接/发送/接收超时
  cancelled,    // 请求被取消
  tls,          // TLS/证书等握手失败
  dns,          // DNS 解析失败
  unauthorized, // 401 未授权（含凭证失效）
  httpRetryable,// 5xx/429 等可重试 HTTP
  httpOther,    // 其它非可重试 HTTP
  unknown,      // 未识别错误
}

/// 标准化后的网络错误信息（含可选的HTTP状态码）
class NetErrInfo {
  final NetErrCode code;
  final int? httpStatus;
  const NetErrInfo(this.code, {this.httpStatus});
}
