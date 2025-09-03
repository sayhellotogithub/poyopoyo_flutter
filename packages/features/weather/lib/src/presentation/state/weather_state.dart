// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description: 
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:poyopoyo_weather/src/domain/entities/weather.dart';

import '../../domain/entities/forecast_weather.dart';

class WeatherState {
  final Weather? current;
  final List<ForecastWeather>? forecast;
  final bool isLoading;
  final Failure? errorMessage;

  WeatherState({
    this.current,
    this.forecast,
    this.isLoading = false,
    this.errorMessage,
  });

  WeatherState copyWith({
    Weather? current,
    List<ForecastWeather>? forecast,
    bool? isLoading,
    Failure? errorMessage,
  }) {
    return WeatherState(
      current: current ?? this.current,
      forecast: forecast ?? this.forecast,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  factory WeatherState.initial() => WeatherState(isLoading: false);
}
