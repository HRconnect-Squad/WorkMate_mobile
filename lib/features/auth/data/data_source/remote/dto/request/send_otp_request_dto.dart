class SendOtpRequestDto {
  final String type;
  final String loginType;
  final String identifier;

  const SendOtpRequestDto({
    required this.type,
    required this.loginType,
    required this.identifier,
  });

  Map<String, dynamic> toJson() => {
    'type': type,
    'login_type': loginType,
    'identifier': identifier,
  };
}