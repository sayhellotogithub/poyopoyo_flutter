// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'package:data/common/envelope_classifier.dart';
import 'package:domain/domain.dart';
import 'package:retrofit/retrofit.dart';

AppResult<T> fromHttpResponse<T>(
  HttpResponse resp, {
  required T Function(dynamic json) mapData,
}) {
  final status = resp.response.statusCode ?? 0;
  final body = resp.data; // 已经是反序列化后的 Map 或其他结构
  return classifyEnvelope<T>(status, body, mapData: mapData);
}
