// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description: 
// -------------------------------------------------------------------
abstract class AuthService {
  Future<bool> isLoggedIn();
  Future<String?> currentUserName();
}