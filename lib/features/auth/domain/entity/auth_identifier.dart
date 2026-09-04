import 'package:equatable/equatable.dart';

import 'auth_type.dart';

class AuthIdentifier extends Equatable {
  final String value;
  final AuthType type;

  const AuthIdentifier({
    required this.value,
    required this.type,
  });

  @override
  List<Object?> get props => [value, type];

}