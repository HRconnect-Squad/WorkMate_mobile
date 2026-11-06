class ContactDto {
  final int? id;
  final String? email;
  final String? phone;
  final String? fullName;
  final String? profileImage;

  const ContactDto({
    this.id,
    this.email,
    this.phone,
    this.fullName,
    this.profileImage,
  });

  factory ContactDto.fromJson(Map<String, dynamic> json) => ContactDto(
    id: json['id'] as int?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    fullName: json['full_name'] as String?,
    profileImage: json['profile_image'] as String?,
  );
}