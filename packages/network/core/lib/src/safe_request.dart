// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------

import 'dart:convert';


import 'client.dart';
import 'failure.dart';
import 'net_response_body.dart';
import 'result.dart';
import 'request.dart';

typedef Decoder<T> = T Function(NetResponseBody);

Future<Result<T, NetFailure>> safeRequest<T>(
  INetworkClient client,
  Request req,
  Decoder<T> decode,
) async {
  final r = await client.send(req);
  return r.fold(
    (res) {
      if (res.status >= 200 && res.status < 300) {
        try {
          return Ok(decode(res));
        } catch (e) {
          return Err(NetUnknown(e));
        }
      } else if (res.status == 401) {
        return Err(NetUnauthorized());
      } else {
        return Err(NetHttpError(res.status, message: _maybeErrMsg(res)));
      }
    },
    (e) => Err(e),
  );
}

String? _maybeErrMsg(NetResponseBody res) {
  try {
    final s = utf8.decode(res.bytes);
    final j = jsonDecode(s);
    if (j is Map && j['message'] is String) return j['message'] as String;
    return null;
  } catch (_) {
    return null;
  }
}
