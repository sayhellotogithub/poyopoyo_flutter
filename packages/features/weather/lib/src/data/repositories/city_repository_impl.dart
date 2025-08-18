// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description:
// -------------------------------------------------------------------


import '../../core/network/api_response.dart';
import '../../core/network/dio_helper.dart';
import '../../domain/entities/city.dart';
import '../../domain/repositories/city_repository.dart';
import '../network/city_api.dart';

class CityRepositoryImpl implements CityRepository {
  final CityApi api;
  final String apiKey;

  CityRepositoryImpl({required this.api, required this.apiKey});

  @override
  Future<ApiResponse<List<City>>> searchCities(String keyword) {
    return safeRequest(() async {
      final dtos = await api.searchCities(keyword, 5, apiKey);
      return dtos.map((dto) => dto.toEntity()).toList();
    });
  }
}
