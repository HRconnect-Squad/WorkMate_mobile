import '../../../../../../../core/data/exception/app_exception.dart';
import '../user_dto.dart';

class LoginResponse {
  final UserDto? user;
  final String? accessToken;
  final String? tokenType;

  const LoginResponse({
    required this.user,
    required this.accessToken,
    this.tokenType = 'Bearer',
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final accessToken = json['access_token'] as String?;
    final userData = json['user'] as Map<String, dynamic>?;

    if (accessToken == null || accessToken.isEmpty) {
      throw const ServerException(
        message: 'Invalid response: missing access token',
        code: 'PARSE_ERROR',
        statusCode: 200,
      );
    }

    if (userData == null) {
      throw const ServerException(
        message: 'Invalid response: missing user data',
        code: 'PARSE_ERROR',
        statusCode: 200,
      );
    }

    return LoginResponse(
      user: UserDto.fromJson(userData),
      accessToken: accessToken,
      tokenType: json['token_type'] as String? ?? 'Bearer',
    );
  }
}
