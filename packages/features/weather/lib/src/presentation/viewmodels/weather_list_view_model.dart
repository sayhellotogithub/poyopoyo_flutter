// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/20
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/usecases/fetch_current_weather_usecase.dart';
import '../../application/usecases/fetch_weather_by_location_usecase.dart';
import '../../domain/entities/weather.dart';
import '../providers/weather_providers.dart';

class WeatherListState {
  final List<Weather> weatherList;
  final bool isLoading;
  final Failure? error;

  WeatherListState({
    this.weatherList = const [],
    this.isLoading = false,
    this.error,
  });

  WeatherListState copyWith({
    List<Weather>? weatherList,
    bool? isLoading,
    Failure? error,
  }) {
    return WeatherListState(
      weatherList: weatherList ?? this.weatherList,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class WeatherListViewModel extends Notifier<WeatherListState> {
  late final FetchWeatherByLocationUseCase _fetchWeatherByLocationUseCase;
  late final FetchCurrentWeatherUseCase _currentWeatherUseCase;

  @override
  WeatherListState build() {
    _fetchWeatherByLocationUseCase = ref.watch(
      fetchCurrentWeatherByLocationUseCaseProvider,
    );
    _currentWeatherUseCase = ref.watch(fetchCurrentWeatherUseCaseProvider);

    return WeatherListState();
  }

  Future<void> addWeatherByLocation(double lat, double lon, String lang) async {
    state = state.copyWith(isLoading: true);
    final currentRes = await _fetchWeatherByLocationUseCase.execute(
      lat,
      lon,
      lang: lang,
    );

    state = currentRes.fold(
      (data) => state.copyWith(
        weatherList: [...state.weatherList, data],
        isLoading: false,
        error: null,
      ),
      (failure) => state.copyWith(
        isLoading: false,
        error: failure, // 保存 messageKey，UI 再渲染
      ),
    );
  }

  Future<void> addWeatherByCity(String cityName, String lang) async {
    state = state.copyWith(isLoading: true);
    final currentRes = await _currentWeatherUseCase.execute(
      cityName,
      lang: lang,
    );

    state = currentRes.fold(
      (data) => state.copyWith(
        weatherList: [...state.weatherList, data],
        isLoading: false,
        error: null,
      ),
      (failure) => state.copyWith(isLoading: false, error: failure),
    );
  }
}
