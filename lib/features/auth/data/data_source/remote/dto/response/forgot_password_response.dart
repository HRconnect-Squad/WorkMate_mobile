import '../../../../../../../core/data/exception/app_exception.dart';

class ForgotPasswordResponse {
  final String? identifier;
  final String? otpType;
  final int? devOtp;

  const ForgotPasswordResponse({
    required this.identifier,
    required this.otpType,
    this.devOtp,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    final identifier = json['identifier'] as String?;
    final otpType = json['otp_type'] as String?;

    if (identifier == null || identifier.isEmpty) {
      throw const ServerException(
        message: 'Invalid response: missing identifier',
        code: 'PARSE_ERROR',
        statusCode: 200,
      );
    }
    if (otpType == null || otpType.isEmpty) {
      throw const ServerException(
        message: 'Invalid response: missing otp_type',
        code: 'PARSE_ERROR',
        statusCode: 200,
      );
    }

    return ForgotPasswordResponse(
      identifier: identifier,
      otpType: otpType,
      devOtp: json['dev_otp'] as int? ?? 0,
    );
  }
}
