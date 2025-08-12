// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiEnvelope<T> _$ApiEnvelopeFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiEnvelope<T>(
      success: json['success'] as bool,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      code: json['code'] as String?,
      message: json['message'] as String?,
      traceId: json['traceId'] as String?,
    );

Map<String, dynamic> _$ApiEnvelopeToJson<T>(
  ApiEnvelope<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'code': instance.code,
      'message': instance.message,
      'traceId': instance.traceId,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
