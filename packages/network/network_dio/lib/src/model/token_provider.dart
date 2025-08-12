// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description: 
// -------------------------------------------------------------------
abstract interface class TokenProvider {
  /// 获取当前可用的 Token（可能为空）。
  Future<String?> get();

  /// 刷新 Token（通常在 401 未授权时触发）。
  Future<void> refresh();
}

class SimpleTokenProvider implements TokenProvider {
  String? _token;

  @override
  Future<String?> get() async => _token;

  @override
  Future<void> refresh() async {
    // 调用刷新接口，例如 /auth/refresh
    // 假设返回的新 token 为 newToken
    final newToken = 'new_token_from_server';
    _token = newToken;
  }

  void setToken(String? t) => _token = t;
}