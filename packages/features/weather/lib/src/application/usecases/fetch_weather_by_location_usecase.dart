// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/20
// Description:
// -------------------------------------------------------------------


import 'package:domain/domain.dart';

import '../../core/network/api_response.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

class FetchWeatherByLocationUseCase {
  final WeatherRepository repository;

  FetchWeatherByLocationUseCase(this.repository);

  Future<AppResult<Weather>> execute(
      double lat,
    double lon, {
    String lang = 'ja',
  }) async {
    return repository.fetchCurrentWeatherByLocation(
      lat: lat,
      lon: lon,
      lang: lang,
    );
  }
}
