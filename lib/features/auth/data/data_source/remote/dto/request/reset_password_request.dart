class ResetPasswordRequest {
  final String identifier;
  final String code;
  final String password;
  final String passwordConfirmation;

  const ResetPasswordRequest({
    required this.identifier,
    required this.code,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'code': code,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
