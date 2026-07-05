class SendOtpResponseDto {
  final String? identifier;
  final String? loginType;
  final String? otpType;

  const SendOtpResponseDto({
    this.identifier,
    this.loginType,
    this.otpType,
  });

  factory SendOtpResponseDto.fromJson(Map<String, dynamic> json) {
    return SendOtpResponseDto(
      identifier: json['identifier'] as String?,
      loginType: json['login_type'] as String?,
      otpType: json['otp_type'] as String?,
    );
  }
}