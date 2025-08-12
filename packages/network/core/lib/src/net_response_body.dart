// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description: 
// -------------------------------------------------------------------
import 'dart:convert';
import 'dart:typed_data';

class NetResponseBody {
  final int status;                    // HTTP 状态码或协议状态码
  final Map<String, String> headers;   // 响应头（已扁平化）
  final Uint8List bytes;               // 响应体原始字节

  const NetResponseBody({
    required this.status,
    required this.headers,
    required this.bytes,
  });

  String asString([Encoding enc = utf8]) => enc.decode(bytes);
  dynamic asJson() => jsonDecode(asString());
}