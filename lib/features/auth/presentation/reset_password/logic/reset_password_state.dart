import 'package:equatable/equatable.dart';

import '../../../domain/entity/user.dart';

class ResetPasswordState extends Equatable {
  final String identifier;
  final String otp;
  final String password;
  final String confirmPassword;
  final String? otpError;
  final String? passwordError;
  final String? confirmPasswordError;
  final bool isLoading;
  final bool isSuccess;
  final User? user;
  final String? apiError;

  const ResetPasswordState({
    this.identifier = '',
    this.otp = '',
    this.password = '',
    this.confirmPassword = '',
    this.otpError,
    this.passwordError,
    this.confirmPasswordError,
    this.isLoading = false,
    this.isSuccess = false,
    this.user,
    this.apiError,
  });

  bool get isOtpComplete => otp.length == 6;

  ResetPasswordState copyWith({
    String? identifier,
    String? otp,
    String? password,
    String? confirmPassword,
    String? otpError,
    String? passwordError,
    String? confirmPasswordError,
    bool? isLoading,
    bool? isSuccess,
    User? user,
    String? apiError,
    bool clearOtpError = false,
    bool clearPasswordError = false,
    bool clearConfirmPasswordError = false,
    bool clearApiError = false,
  }) {
    return ResetPasswordState(
      identifier: identifier ?? this.identifier,
      otp: otp ?? this.otp,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      otpError: clearOtpError ? null : (otpError ?? this.otpError),
      passwordError: clearPasswordError ? null : (passwordError ?? this.passwordError),
      confirmPasswordError: clearConfirmPasswordError ? null : (confirmPasswordError ?? this.confirmPasswordError),
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user ?? this.user,
      apiError: clearApiError ? null : (apiError ?? this.apiError),
    );
  }

  @override
  List<Object?> get props => [
    identifier,
    otp,
    password,
    confirmPassword,
    otpError,
    passwordError,
    confirmPasswordError,
    isLoading,
    isSuccess,
    user,
    apiError
  ];
}