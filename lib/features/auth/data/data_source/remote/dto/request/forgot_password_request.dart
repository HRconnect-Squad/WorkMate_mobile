import '../../../../../domain/entity/auth_type.dart';

class ForgotPasswordRequest {
  final String identifier;
  final String type;
  final AuthType loginType;

  const ForgotPasswordRequest({
    required this.identifier,
    this.type = 'password_reset',
    required this.loginType,
  });

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'type': type,
      'login_type': loginType.value,
    };
  }
}
