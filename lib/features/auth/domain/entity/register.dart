import 'package:equatable/equatable.dart';

import 'auth_type.dart';

class Register extends Equatable {
  final String password;
  final String passwordConfirmation;
  final String phone;
  final AuthType authType;
  final String email;

    const Register({
        required this.password,
        required this.passwordConfirmation,
        required this.phone,
        required this.authType,
        required this.email,
    });

  @override
  List<Object?> get props => [password, passwordConfirmation, phone, authType, email];
}
