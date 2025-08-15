// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_core/core.dart';
import 'package:network_dio/network_dio.dart';

final baseUrlProvider = Provider<String>((_) => 'https://api.example.com');
final authUrlProvider = Provider<String>((_) => 'https://auth.example.com');

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 20),
  ));
  dio.interceptors.addAll([
    LogInterceptor(requestBody: true, responseBody: false),
  ]);
  return dio;
});

final tokenProvider =
    Provider<SimpleTokenProvider>((_) => SimpleTokenProvider());
@Deprecated('')
final networkClientProvider = Provider<INetworkClient>((ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = ref.watch(baseUrlProvider);
  final token = ref.watch(tokenProvider);
  dio.options.baseUrl = baseUrl;
  return DioClient(dio, tokenProvider: token);
});

final dioInterceptorsProvider = Provider<List<Interceptor>>((ref) {
  return [
    AuthInterceptor(() async {
      // Get the token from secure storage
      return null;
    }),
    SimpleLoggingInterceptor(),
  ];
});
