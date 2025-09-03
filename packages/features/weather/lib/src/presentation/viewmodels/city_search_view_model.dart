// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description:
// -------------------------------------------------------------------
import 'package:action_policy/action_policy.dart';
import 'package:domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/usecases/search_city_usecase.dart';
import '../../domain/entities/city.dart';
import '../providers/city_providers.dart';

class CitySearchState {
  final bool isLoading;
  final List<City> results;
  final Failure? error;

  CitySearchState({
    this.isLoading = false,
    this.results = const [],
    this.error,
  });

  CitySearchState copyWith({
    bool? isLoading,
    List<City>? results,
    Failure? error,
  }) {
    return CitySearchState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
      error: error,
    );
  }
}

class CitySearchViewModel extends Notifier<CitySearchState> {
  late final SearchCityUseCase _searchCityUseCase;

  @override
  CitySearchState build() {
    _searchCityUseCase = ref.read(searchCityUseCaseProvider);
    return CitySearchState();
  }

  void clearResults() {
    state = state.copyWith(results: [], error: null);
  }

  Future<void> search(String keyword) async {
    if (keyword.isEmpty) {
      state = state.copyWith(results: [], error: null, isLoading: false);
      return;
    }

    state = state.copyWith(isLoading: true);

    final AppResult<List<City>> res = await _searchCityUseCase.execute(keyword);

    state = res.fold(
      (data) => state.copyWith(results: data, isLoading: false, error: null),
      (failure) => state.copyWith(isLoading: false, error: failure),
    );
  }
}
