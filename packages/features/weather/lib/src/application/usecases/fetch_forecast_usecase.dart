// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description:
// -------------------------------------------------------------------
import 'package:domain/domain.dart';

import '../../core/network/api_response.dart';
import '../../domain/entities/forecast_weather.dart';
import '../../domain/repositories/weather_repository.dart';

class FetchForecastUseCase {
  final WeatherRepository repository;

  FetchForecastUseCase(this.repository);

  Future<AppResult<List<ForecastWeather>>> execute(
    String cityName, {
    String lang = 'ja',
  }) {
    return repository.fetchForecast(cityName: cityName, lang: lang);
  }
}
