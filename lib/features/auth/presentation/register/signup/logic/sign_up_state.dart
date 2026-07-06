import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String countryCode;

  final String? emailError;
  final String? phoneError;
  final String? passwordError;
  final String? confirmPasswordError;

  final bool isCheckedTermsAndConditions;
  final bool isObscurePassword;
  final bool isObscureConfirmPassword;

  final bool isLoading;
  final bool isRegistered;
  final String? apiError;

  const SignUpState({
    this.email = '',
    this.phone = '',
    this.password = '',
    this.confirmPassword = '',
    this.countryCode = '20',
    this.emailError,
    this.phoneError,
    this.passwordError,
    this.confirmPasswordError,
    this.isCheckedTermsAndConditions = false,
    this.isObscurePassword = true,
    this.isObscureConfirmPassword = true,
    this.isLoading = false,
    this.isRegistered = false,
    this.apiError,
  });

  bool get isFormValid =>
      email.isNotEmpty &&
          phone.isNotEmpty &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          isCheckedTermsAndConditions;

  String get fullPhoneNumber => '+$countryCode$phone';

  SignUpState copyWith({
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
    String? countryCode,
    String? emailError,
    String? phoneError,
    String? passwordError,
    String? confirmPasswordError,
    bool? isCheckedTermsAndConditions,
    bool? isObscurePassword,
    bool? isObscureConfirmPassword,
    bool? isLoading,
    bool? isRegistered,
    String? apiError,
    bool clearEmailError = false,
    bool clearPhoneError = false,
    bool clearPasswordError = false,
    bool clearConfirmPasswordError = false,
    bool clearApiError = false,
  }) {
    return SignUpState(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      countryCode: countryCode ?? this.countryCode,
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
      phoneError: clearPhoneError ? null : (phoneError ?? this.phoneError),
      passwordError: clearPasswordError ? null : (passwordError ?? this.passwordError),
      confirmPasswordError: clearConfirmPasswordError ? null : (confirmPasswordError ?? this.confirmPasswordError),
      isCheckedTermsAndConditions: isCheckedTermsAndConditions ?? this.isCheckedTermsAndConditions,
      isObscurePassword: isObscurePassword ?? this.isObscurePassword,
      isObscureConfirmPassword: isObscureConfirmPassword ?? this.isObscureConfirmPassword,
      isLoading: isLoading ?? this.isLoading,
      isRegistered: isRegistered ?? this.isRegistered,
      apiError: clearApiError ? null : (apiError ?? this.apiError),
    );
  }

  @override
  List<Object?> get props => [
    email,
    phone,
    password,
    confirmPassword,
    countryCode,
    emailError,
    phoneError,
    passwordError,
    confirmPasswordError,
    isCheckedTermsAndConditions,
    isObscurePassword,
    isObscureConfirmPassword,
    isLoading,
    isRegistered,
    apiError,
  ];
}