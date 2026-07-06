class ChangePasswordRequestDto {
  final String currentPassword;
  final String newPassword;
  final String newPasswordConfirmation;

  const ChangePasswordRequestDto({
    required this.currentPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'current_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation,
    };
  }
}