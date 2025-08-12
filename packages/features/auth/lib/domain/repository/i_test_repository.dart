// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import 'package:network_core/core.dart';

import '../entities/User.dart';

abstract class ITestRepository {
  Future<Result<User, NetFailure>> test();
}
