class AssignedUserDto {
  final int id;
  final String? phone;
  final String email;
  final bool isActive;
  final String loginType;
  final String role;
  final String? fcmToken;
  final String? lastLoginAt;
  final String? emailVerifiedAt;
  final String? phoneVerifiedAt;
  final String createdAt;

  const AssignedUserDto({
    required this.id,
    this.phone,
    required this.email,
    required this.isActive,
    required this.loginType,
    required this.role,
    this.fcmToken,
    this.lastLoginAt,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    required this.createdAt,
  });

  factory AssignedUserDto.fromJson(Map<String, dynamic> json) =>
      AssignedUserDto(
        id: json['id'] as int,
        phone: json['phone'] as String?,
        email: json['email'] as String,
        isActive: json['is_active'] as bool,
        loginType: json['login_type'] as String,
        role: json['role'] as String,
        fcmToken: json['fcm_token'] as String?,
        lastLoginAt: json['last_login_at'] as String?,
        emailVerifiedAt: json['email_verified_at'] as String?,
        phoneVerifiedAt: json['phone_verified_at'] as String?,
        createdAt: json['created_at'] as String,
      );
}