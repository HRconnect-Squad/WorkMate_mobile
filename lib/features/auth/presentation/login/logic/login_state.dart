import 'package:equatable/equatable.dart';
import '../../../domain/entity/user.dart';

class LoginState extends Equatable {
  final String identifier;
  final String password;
  final String countryCode;
  final String? identifierError;
  final String? passwordError;
  final bool isLoading;
  final bool isSuccess;
  final User? user;
  final String? apiError;
  final bool rememberMe;
  final String? savedIdentifier;
  final String? unverifiedIdentifier;

  const LoginState({
    this.identifier = '',
    this.password = '',
    this.countryCode = '20',
    this.identifierError,
    this.passwordError,
    this.isLoading = false,
    this.isSuccess = false,
    this.user,
    this.apiError,
    this.rememberMe = false,
    this.savedIdentifier,
    this.unverifiedIdentifier,
  });

  bool get isFormValid =>
      identifier.trim().isNotEmpty && password.isNotEmpty;

  String get fullPhoneNumber => '+$countryCode$identifier';

  bool get needsVerification => unverifiedIdentifier != null;

  LoginState copyWith({
    String? identifier,
    String? password,
    String? countryCode,
    String? identifierError,
    String? passwordError,
    bool? isLoading,
    bool? isSuccess,
    User? user,
    String? apiError,
    bool? rememberMe,
    String? savedIdentifier,
    String? unverifiedIdentifier,
    bool clearIdentifierError = false,
    bool clearPasswordError = false,
    bool clearApiError = false,
    bool clearUnverifiedIdentifier = false,
  }) {
    return LoginState(
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
      countryCode: countryCode ?? this.countryCode,
      identifierError: clearIdentifierError
          ? null
          : (identifierError ?? this.identifierError),
      passwordError: clearPasswordError
          ? null
          : (passwordError ?? this.passwordError),
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user ?? this.user,
      apiError: clearApiError ? null : (apiError ?? this.apiError),
      rememberMe: rememberMe ?? this.rememberMe,
      savedIdentifier: savedIdentifier ?? this.savedIdentifier,
      unverifiedIdentifier: clearUnverifiedIdentifier
          ? null
          : (unverifiedIdentifier ?? this.unverifiedIdentifier),
    );
  }

  @override
  List<Object?> get props => [
    identifier,
    password,
    countryCode,
    identifierError,
    passwordError,
    isLoading,
    isSuccess,
    user,
    apiError,
    rememberMe,
    savedIdentifier,
    unverifiedIdentifier,
  ];
}