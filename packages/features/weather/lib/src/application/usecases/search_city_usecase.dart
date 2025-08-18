// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description: 
// -------------------------------------------------------------------

import '../../core/network/api_response.dart';
import '../../domain/entities/city.dart';
import '../../domain/repositories/city_repository.dart';

class SearchCityUseCase {
  final CityRepository repository;

  SearchCityUseCase(this.repository);

  Future<ApiResponse<List<City>>> execute(String keyword) {
    return repository.searchCities(keyword);
  }
}
