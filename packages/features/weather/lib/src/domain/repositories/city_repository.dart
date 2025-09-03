// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/07/19
// Description: 
// -------------------------------------------------------------------
import 'package:domain/domain.dart';

import '../../core/network/api_response.dart';
import '../entities/city.dart';

abstract class CityRepository {
  Future<AppResult<List<City>>> searchCities(String keyword);
}