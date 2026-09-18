class RegisterDtoRequest {
  final String password;
  final String passwordConfirmation;
  final String phone;
  final String loginType;
  final String email;

  RegisterDtoRequest({
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    required this.loginType,
    required this.email,
  });

  factory RegisterDtoRequest.fromJson(Map<String, dynamic> json) =>
      RegisterDtoRequest(
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        phone: json["phone"],
        loginType: json["login_type"],
        email: json["email"],
      );

  Map<dynamic, dynamic> toJson() => {
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "phone": phone,
    "login_type": loginType,
    "role": "employee",
  };
}
