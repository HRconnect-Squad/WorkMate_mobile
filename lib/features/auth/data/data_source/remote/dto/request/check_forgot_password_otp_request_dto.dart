class CheckForgotPasswordOtpRequestDto {
  final String identifier;
  final String code;

  const CheckForgotPasswordOtpRequestDto({
    required this.identifier,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
    'identifier': identifier,
    'code': code,
  };
}