// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description: 
// -------------------------------------------------------------------
class RetryPolicy {
  /// 最大尝试次数（包含首次请求）
  final int maxAttempts;

  /// 每次重试之间的等待时间（可用于固定间隔或配合退避策略）
  final Duration backoff;

  const RetryPolicy({
    this.maxAttempts = 1,
    this.backoff = const Duration(milliseconds: 300),
  });
}