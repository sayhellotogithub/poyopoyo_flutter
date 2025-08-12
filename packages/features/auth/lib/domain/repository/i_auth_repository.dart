// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/12
// Description:
// -------------------------------------------------------------------
import '../entities/User.dart';

abstract class IAuthRepository {
  Future<User> selfApiInformation();
}
