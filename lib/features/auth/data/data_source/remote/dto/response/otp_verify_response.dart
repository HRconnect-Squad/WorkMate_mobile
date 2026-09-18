import '../../../../../../../core/data/exception/app_exception.dart';
import '../user_dto.dart';

class OtpVerifyResponse {
  final UserDto? user;
  final String? accessToken;
  final String? tokenType;

  OtpVerifyResponse({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    final accessToken = json['access_token'] as String?;
    final userData = json['user'] as Map<String, dynamic>?;

    if (accessToken == null || accessToken.isEmpty) {
      throw const SerializationException(
        message: 'Invalid response: missing access token',
      );
    }

    if (userData == null) {
      throw const SerializationException(
        message: 'Invalid response: missing user data',
      );
    }

    return OtpVerifyResponse(
      user: UserDto.fromJson(userData),
      accessToken: accessToken,
      tokenType: json['token_type'],
    );
  }

}
