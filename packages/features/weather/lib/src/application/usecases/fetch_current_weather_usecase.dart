// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description:
// -------------------------------------------------------------------
import 'package:domain/domain.dart';
import 'package:poyopoyo_weather/src/domain/entities/weather.dart';
import 'package:poyopoyo_weather/src/domain/repositories/weather_repository.dart';

class FetchCurrentWeatherUseCase {
  final WeatherRepository repository;

  FetchCurrentWeatherUseCase(this.repository);

  Future<AppResult<Weather>> execute(String cityName, {String lang = 'ja'}) {
    return repository.fetchCurrentWeather(cityName: cityName, lang: lang);
  }
}
