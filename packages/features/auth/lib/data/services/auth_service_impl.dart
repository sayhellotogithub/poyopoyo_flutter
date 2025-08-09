// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/09
// Description: 
// -------------------------------------------------------------------
import 'package:contracts/auth/auth_service.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<bool> isLoggedIn() async => true;

  @override
  Future<String?> currentUserName() async => 'Poyopoyo';
}