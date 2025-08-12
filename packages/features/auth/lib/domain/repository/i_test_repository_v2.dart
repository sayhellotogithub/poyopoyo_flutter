// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------

import 'package:domain/types.dart';

import '../entities/User.dart';

abstract class ITestRepositoryV2 {
  Future<AppResult<User>> test();
}
