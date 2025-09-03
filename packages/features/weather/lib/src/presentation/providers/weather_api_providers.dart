// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description:
// -------------------------------------------------------------------
import 'package:di/network_providers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/weather_api_client.dart';

final weatherApiClientProvider = Provider<WeatherApiClient>((ref) {
  final apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? '';
  final baseUrl = dotenv.env['OPENWEATHER_SITE'] ?? '';
  final dio = ref.read(dioProvider);
  return WeatherApiClient(dio: dio, apiKey: apiKey, baseUrl: baseUrl);
});
