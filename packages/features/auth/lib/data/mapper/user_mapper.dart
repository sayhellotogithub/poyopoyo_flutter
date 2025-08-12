// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/11
// Description:
// -------------------------------------------------------------------
import 'package:dto/dto.dart';

import '../../domain/entities/User.dart';

extension UserDtoMapper on UserDto {
  User toEntity() => User(
        id: id,
        name: name,
        email: email,
        avatarUrl: avatarUrl,
        role: role,
        createdAt: createdAt,
      );
}
