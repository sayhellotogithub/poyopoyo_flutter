// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description:
// -------------------------------------------------------------------
import 'package:poyopoyo_weather/src/core/network/api_response.dart';
import 'package:poyopoyo_weather/src/domain/entities/weather.dart';
import 'package:poyopoyo_weather/src/domain/repositories/weather_repository.dart';

class FetchCurrentWeatherUseCase {
  final WeatherRepository repository;

  FetchCurrentWeatherUseCase(this.repository);

  Future<ApiResponse<Weather>> execute(String cityName, {String lang = 'ja'}) {
    return repository.fetchCurrentWeather(cityName: cityName, lang: lang);
  }

}
