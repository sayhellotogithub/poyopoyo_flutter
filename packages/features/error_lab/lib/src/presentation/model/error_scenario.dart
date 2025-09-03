// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/20
// Description:
// -------------------------------------------------------------------
enum ScenarioKind { network, business }

enum NetKind { timeout, noConnection, unauthorized, http503, httpOther }

class ErrorScenario {
  final String id;
  final String title;
  final ScenarioKind kind;
  final NetKind? netKind;
  final int? httpStatus; // for httpOther
  final String? bizCode; // for business
  final String? bizMessage;

  const ErrorScenario.network({
    required this.id,
    required this.title,
    required this.netKind,
    this.httpStatus,
  })  : kind = ScenarioKind.network,
        bizCode = null,
        bizMessage = null;

  const ErrorScenario.business({
    required this.id,
    required this.title,
    required this.bizCode,
    this.bizMessage,
  })  : kind = ScenarioKind.business,
        netKind = null,
        httpStatus = null;
}

// 预置用例
class PresetScenarios {
  static final List<ErrorScenario> all = [
// 网络类
    const ErrorScenario.network(
        id: 'NET_TIMEOUT', title: 'Timeout (重试)', netKind: NetKind.timeout),
    const ErrorScenario.network(
        id: 'NET_OFFLINE',
        title: 'No Connection (重试)',
        netKind: NetKind.noConnection),
    const ErrorScenario.network(
        id: 'NET_401',
        title: 'Unauthorized 401 (跳登录)',
        netKind: NetKind.unauthorized),
    const ErrorScenario.network(
        id: 'NET_503', title: 'HTTP 503 (重试)', netKind: NetKind.http503),
    const ErrorScenario.network(
        id: 'NET_418',
        title: 'HTTP 418 (弹窗)',
        netKind: NetKind.httpOther,
        httpStatus: 418),

// 业务类
    const ErrorScenario.business(
        id: 'AUTH_INVALID',
        title: 'AUTH_INVALID_CREDENTIALS (回表单)',
        bizCode: 'AUTH_INVALID_CREDENTIALS',
        bizMessage: 'Invalid credentials'),
    const ErrorScenario.business(
        id: 'AUTH_EXPIRED',
        title: 'AUTH_TOKEN_EXPIRED (跳登录)',
        bizCode: 'AUTH_TOKEN_EXPIRED',
        bizMessage: 'Session expired'),
    const ErrorScenario.business(
        id: 'PAY_3DS',
        title: 'PAY_THREE_DS_REQUIRED (走3DS)',
        bizCode: 'PAY_THREE_DS_REQUIRED',
        bizMessage: '3DS required'),
    const ErrorScenario.business(
        id: 'COMMON_BUSY',
        title: 'COMMON_SERVER_BUSY (重试)',
        bizCode: 'COMMON_SERVER_BUSY',
        bizMessage: 'Server busy'),
  ];
}
