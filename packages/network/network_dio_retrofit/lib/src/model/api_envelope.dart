// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description: 
// -------------------------------------------------------------------
import 'package:json_annotation/json_annotation.dart';

part 'api_envelope.g.dart';

/// 统一响应包裹（Envelope Pattern）
/// 格式建议：{ success, data?, code?, message?, traceId? }
@JsonSerializable(genericArgumentFactories: true)
class ApiEnvelope<T> {
  final bool success;
  final T? data;
  final String? code;
  final String? message;
  final String? traceId;

  const ApiEnvelope({
    required this.success,
    this.data,
    this.code,
    this.message,
    this.traceId,
  });

  factory ApiEnvelope.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$ApiEnvelopeFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
      Object? Function(T value) toJsonT,
      ) =>
      _$ApiEnvelopeToJson(this, toJsonT);
}
