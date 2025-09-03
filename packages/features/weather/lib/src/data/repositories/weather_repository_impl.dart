// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/18
// Description:
// -------------------------------------------------------------------
import 'package:domain/domain.dart';
import 'package:network_dio_retrofit/network_dio_retrofit.dart';
import 'package:poyopoyo_weather/src/domain/entities/weather.dart';

import '../../domain/entities/forecast_weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../models/forecast_response_dto.dart';
import '../models/forecast_weather_dto.dart';
import '../models/weather_dto.dart';
import '../network/weather_api.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApi api;
  final String apiKey;

  WeatherRepositoryImpl({required this.api, required this.apiKey});

  @override
  Future<AppResult<Weather>> fetchCurrentWeather({
    required String cityName,
    String lang = 'ja',
  }) {
    return safeRequestRetrofit(
        () => api.fetchCurrentByCity(cityName, apiKey, lang, 'metric'),
        mapData: (json) {
      if (json is WeatherDto) return json.toEntity();
      return json;
    });
  }

  @override
  Future<AppResult<List<ForecastWeather>>> fetchForecast({
    required String cityName,
    String lang = 'ja',
  }) {
    return safeRequestRetrofit(
      () => api.fetchForecast(cityName, apiKey, lang, 'metric'),
      mapData: (json) {
        if (json is ForecastResponseDto) {
          return (json.list as List)
              .map((e) => e is ForecastWeatherDto
                  ? e.toEntity()
                  : ForecastWeatherDto.fromJson(e).toEntity())
              .toList(growable: false);
        } else {
          return [];
        }
      },
    );
  }

  @override
  Future<AppResult<Weather>> fetchCurrentWeatherByLocation({
    required double lat,
    required double lon,
    String lang = 'ja',
  }) {
    return safeRequestRetrofit(
      () => api.fetchCurrentByLocation(lat, lon, apiKey, lang, 'metric'),
      mapData: (json) {
        if (json is WeatherDto)
          return json.toEntity();
        else
          return WeatherDto.fromJson(json).toEntity();
      },
    );
  }

  @override
  Future<AppResult<List<ForecastWeather>>> fetchForecastByLocation({
    required double lat,
    required double lon,
    String lang = 'ja',
  }) {
    return safeRequestRetrofit<List<ForecastWeather>>(
        () => api.fetchForecastByLocation(lat, lon, apiKey, lang, 'metric'),
        mapData: (json) {
      if (json is ForecastResponseDto) {
        return (json.list as List)
            .map((e) => e is ForecastWeatherDto
                ? e.toEntity()
                : ForecastWeatherDto.fromJson(e).toEntity())
            .toList(growable: false);
      } else {
        return [];
      }
    });
  }
}
