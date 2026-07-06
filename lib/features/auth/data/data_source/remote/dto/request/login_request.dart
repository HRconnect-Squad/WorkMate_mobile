import '../../../../../domain/entity/auth_type.dart';

class LoginRequest {
  final String identifier;
  final String password;
  final AuthType loginType;

  const LoginRequest({
    required this.identifier,
    required this.loginType,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'password': password,
      'login_type': loginType.value,
    };
  }
}
