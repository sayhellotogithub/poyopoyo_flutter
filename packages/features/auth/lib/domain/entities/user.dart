// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  final String id;
  final String name;
  final String? email;
  final String? avatarUrl;
  final String? role;
  final DateTime? createdAt;

  User(
      {required this.id,
      required this.name,
      this.email,
      this.avatarUrl,
      this.role,
      this.createdAt});
}
