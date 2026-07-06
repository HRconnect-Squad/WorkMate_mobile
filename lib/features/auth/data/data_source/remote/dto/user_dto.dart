import '../../../mappers/auth_mapper.dart';

class UserDto {
  final int? id;
  final String? email;
  final String? phone;
  final bool? isActive;
  final String? role;

  const UserDto({
    required this.id,
    this.email,
    this.phone,
    this.isActive = false,
    this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int?;
    final email = json['email'] as String?;
    final phone = json['phone'] as String?;
    final role = json['role'] as String?;

    // if (id == null) {
    //   throw const ServerException(
    //     message: 'Invalid response: missing id',
    //     code: 'PARSE_ERROR',
    //     statusCode: 200,
    //   );
    // }

    // if (email == null || email.isEmpty || phone == null || phone.isEmpty) {
    //   throw const ServerException(
    //     message: 'Invalid response: missing email or phone',
    //     code: 'PARSE_ERROR',
    //     statusCode: 200,
    //   );
    // }
    //
    //   if (role == null || role.isEmpty) {
    //     throw const ServerException(
    //       message: 'Invalid response: missing role',
    //       code: 'PARSE_ERROR',
    //       statusCode: 200,
    //     );
    //   };

    return UserDto(
      id: id,
      email: email,
      phone: phone,
      isActive: AuthMapper.parseIsActive(json['is_active']),
      role: role,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'is_active': isActive,
      'role': role,
    };
  }

}
