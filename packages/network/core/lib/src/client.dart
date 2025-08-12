// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------

import 'failure.dart';
import 'net_response_body.dart';
import 'request.dart';
import 'result.dart';
import 'stream_event.dart';

abstract interface class INetworkClient {
  Future<Result<NetResponseBody, NetFailure>> send(Request req);

  Stream<Result<StreamEvent, NetFailure>> stream(Request req); // 用于SSE/WS
  void close();
}
