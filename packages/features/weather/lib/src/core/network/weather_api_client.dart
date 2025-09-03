// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description:
// -------------------------------------------------------------------
import 'package:dio/dio.dart';

class WeatherApiClient {
  final Dio dio;
  final String apiKey;
  final String baseUrl;

  WeatherApiClient({
    required this.dio,
    required this.apiKey,
    required this.baseUrl,
  });
}
