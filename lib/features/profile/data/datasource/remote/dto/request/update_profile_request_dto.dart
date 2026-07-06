class UpdateProfileRequestDto {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? dateOfBirth;
  final String? gender;
  final String? address;

  const UpdateProfileRequestDto({
    this.firstName,
    this.lastName,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.address,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (firstName != null && firstName!.isNotEmpty) {
      data['first_name'] = firstName;
    }
    if (lastName != null && lastName!.isNotEmpty) {
      data['last_name'] = lastName;
    }
    if (phone != null && phone!.isNotEmpty) {
      data['phone'] = phone;
    }
    if (dateOfBirth != null && dateOfBirth!.isNotEmpty) {
      data['date_of_birth'] = dateOfBirth;
    }
    if (gender != null && gender!.isNotEmpty) {
      data['gender'] = gender;
    }
    if (address != null && address!.isNotEmpty) {
      data['address'] = address;
    }

    return data;
  }

  bool get hasData =>
      (firstName?.isNotEmpty ?? false) ||
          (lastName?.isNotEmpty ?? false) ||
          (phone?.isNotEmpty ?? false) ||
          (dateOfBirth?.isNotEmpty ?? false) ||
          (gender?.isNotEmpty ?? false) ||
          (address?.isNotEmpty ?? false);
}