// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/13
// Description:
// -------------------------------------------------------------------
import 'package:domain/domain.dart';
import '../entities/User.dart';

abstract class IAuthRepositoryV2 {
  Future<AppResult<User>> selfApiInformation();
}
