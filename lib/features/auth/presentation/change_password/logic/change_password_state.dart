import 'package:equatable/equatable.dart';

import '../../../../../core/config/app_constant.dart';

class ChangePasswordState extends Equatable {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  final String? currentPasswordError;
  final String? newPasswordError;
  final String? confirmPasswordError;

  final bool isLoading;
  final bool isSuccess;
  final String? error;

  final bool obscureCurrentPassword;
  final bool obscureNewPassword;
  final bool obscureConfirmPassword;

  const ChangePasswordState({
    this.currentPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
    this.currentPasswordError,
    this.newPasswordError,
    this.confirmPasswordError,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
    this.obscureCurrentPassword = true,
    this.obscureNewPassword = true,
    this.obscureConfirmPassword = true,
  });

  bool get isFormValid =>
      currentPassword.isNotEmpty &&
          newPassword.length >= AppConstant.passwordLength &&
          confirmPassword == newPassword;

  bool get hasChanges =>
      currentPassword.isNotEmpty ||
          newPassword.isNotEmpty ||
          confirmPassword.isNotEmpty;

  ChangePasswordState copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmPassword,
    String? currentPasswordError,
    String? newPasswordError,
    String? confirmPasswordError,
    bool? isLoading,
    bool? isSuccess,
    String? error,
    bool? obscureCurrentPassword,
    bool? obscureNewPassword,
    bool? obscureConfirmPassword,
    bool clearCurrentPasswordError = false,
    bool clearNewPasswordError = false,
    bool clearConfirmPasswordError = false,
    bool clearError = false,
    bool clearAllErrors = false,
  }) {
    return ChangePasswordState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      currentPasswordError: (clearCurrentPasswordError || clearAllErrors)
          ? null
          : (currentPasswordError ?? this.currentPasswordError),
      newPasswordError: (clearNewPasswordError || clearAllErrors)
          ? null
          : (newPasswordError ?? this.newPasswordError),
      confirmPasswordError: (clearConfirmPasswordError || clearAllErrors)
          ? null
          : (confirmPasswordError ?? this.confirmPasswordError),
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: clearError ? null : (error ?? this.error),
      obscureCurrentPassword: obscureCurrentPassword ?? this.obscureCurrentPassword,
      obscureNewPassword: obscureNewPassword ?? this.obscureNewPassword,
      obscureConfirmPassword: obscureConfirmPassword ?? this.obscureConfirmPassword,
    );
  }

  @override
  List<Object?> get props => [
    currentPassword,
    newPassword,
    confirmPassword,
    currentPasswordError,
    newPasswordError,
    confirmPasswordError,
    isLoading,
    isSuccess,
    error,
    obscureCurrentPassword,
    obscureNewPassword,
    obscureConfirmPassword,
  ];
}