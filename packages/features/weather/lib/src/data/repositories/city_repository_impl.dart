// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description:
// -------------------------------------------------------------------

import 'package:domain/domain.dart';
import 'package:network_dio_retrofit/network_dio_retrofit.dart';

import '../../domain/entities/city.dart';
import '../../domain/repositories/city_repository.dart';
import '../models/city_dto.dart';
import '../network/city_api.dart';

class CityRepositoryImpl implements CityRepository {
  final CityApi api;
  final String apiKey;

  CityRepositoryImpl({required this.api, required this.apiKey});

  @override
  Future<AppResult<List<City>>> searchCities(String keyword) {
    return safeRequestRetrofit(
      () => api.searchCities(keyword, 5, apiKey),
      mapData: (json) {
        return (json as List)
            .map((e) =>
                e is CityDto ? e.toEntity() : CityDto.fromJson(e).toEntity())
            .toList(growable: false);
      },
    );
  }
}
