// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/18
// Description:
// -------------------------------------------------------------------

import 'package:domain/domain.dart';
import 'package:poyopoyo_weather/src/domain/entities/weather.dart';

import '../entities/forecast_weather.dart';

abstract class WeatherRepository {
  Future<AppResult<Weather>> fetchCurrentWeather({
    required String cityName,
    String lang = 'ja',
  });

  Future<AppResult<Weather>> fetchCurrentWeatherByLocation({
    required double lat,
    required double lon,
    String lang = 'ja',
  });

  Future<AppResult<List<ForecastWeather>>> fetchForecast({
    required String cityName,
    String lang = 'ja',
  });

  Future<AppResult<List<ForecastWeather>>> fetchForecastByLocation({
    required double lat,
    required double lon,
    String lang = 'ja',
  });
}
