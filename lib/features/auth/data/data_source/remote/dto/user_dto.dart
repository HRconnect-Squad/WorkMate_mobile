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
