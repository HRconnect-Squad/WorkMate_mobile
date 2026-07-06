import 'package:equatable/equatable.dart';

class ForgotPasswordState extends Equatable {
  final String email;
  final String? emailError;
  final bool isLoading;
  final bool isSuccess;
  final String? successIdentifier;
  final String? apiError;

  const ForgotPasswordState({
    this.email = '',
    this.emailError,
    this.isLoading = false,
    this.isSuccess = false,
    this.successIdentifier,
    this.apiError,
  });

  ForgotPasswordState copyWith({
    String? email,
    String? emailError,
    bool? isLoading,
    bool? isSuccess,
    String? successIdentifier,
    String? apiError,
    bool clearEmailError = false,
    bool clearApiError = false,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      successIdentifier: successIdentifier ?? this.successIdentifier,
      apiError: clearApiError ? null : (apiError ?? this.apiError),
    );
  }

  @override
  List<Object?> get props => [
    email,
    emailError,
    isLoading,
    isSuccess,
    successIdentifier,
    apiError,
  ];
}
