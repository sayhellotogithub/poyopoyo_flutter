// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:freezed_annotation/freezed_annotation.dart';

///- Use frozen to generate immutable classes, copy methods, and comparison operations
///- Use json_serializable to generate JSON serialization and deserialization methods
///- Use freezed_annotation to generate freezed classes
///
part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final String id;
  final String name;
  final String? email;
  final String? avatarUrl;
  final String? role; // 角色（例如 admin/user）
  final DateTime? createdAt; // 注册时间

  const UserDto(
      {required this.id,
      required this.name,
      this.email,
      this.avatarUrl,
      this.role,
      this.createdAt});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
