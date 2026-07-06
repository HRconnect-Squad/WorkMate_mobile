import 'package:workmate/features/auth/data/data_source/remote/dto/user_dto.dart';

import '../../../../../../../core/data/exception/app_exception.dart';

class ResetPasswordResponse {
  final UserDto? user;
  final String? accessToken;
  final String? tokenType;

  const ResetPasswordResponse({
    required this.user,
    required this.accessToken,
    this.tokenType = 'Bearer',
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
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
    return ResetPasswordResponse(
      user: UserDto.fromJson(userData),
      accessToken: accessToken,
      tokenType: json['token_type'] as String? ?? 'Bearer',
    );
  }
}
