// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/21
// Description:
// -------------------------------------------------------------------

import 'package:domain/domain.dart';

import '../../core/network/api_response.dart';
import '../../domain/entities/forecast_weather.dart';
import '../../domain/repositories/weather_repository.dart';

class FetchForecastByLocationUseCase {
  final WeatherRepository repository;

  FetchForecastByLocationUseCase(this.repository);

  Future<AppResult<List<ForecastWeather>>> execute(
    double lat,
    double lon, {
    String lang = 'ja',
  }) {
    return repository.fetchForecastByLocation(lat: lat, lon: lon, lang: lang);
  }
}
