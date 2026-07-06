class CompleteProfileRequestDto {
  final String firstName;
  final String lastName;
  final String? phone;
  final String? dateOfBirth;
  final String? gender;
  final String? address;

  const CompleteProfileRequestDto({
    required this.firstName,
    required this.lastName,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.address,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
    };

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
}