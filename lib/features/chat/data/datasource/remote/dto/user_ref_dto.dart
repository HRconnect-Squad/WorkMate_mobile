/// Only the fields the app needs. The backend sends many more
/// (fcm_token, last_login_at, ...) and they are deliberately ignored.
class UserRefDto {
  final int? id;
  final String? email;

  const UserRefDto({this.id, this.email});

  factory UserRefDto.fromJson(Map<String, dynamic> json) => UserRefDto(
    id: json['id'] as int?,
    email: json['email'] as String?,
  );
}