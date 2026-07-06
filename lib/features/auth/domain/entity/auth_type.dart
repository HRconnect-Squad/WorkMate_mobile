enum AuthType {
  email('email'),
  phone('phone');

  final String value;

  const AuthType(this.value);

  static AuthType fromString(String value) {
    return AuthType.values.firstWhere(
          (type) => type.value == value,
      orElse: () => AuthType.email,
    );
  }
}