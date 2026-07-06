import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? email;
  final String? phone;
  final bool isActive;
  final String? role;

  const User({
     this.id,
    this.email,
    this.phone,
    this.isActive = false,
    this.role,
  });

  bool get hasEmail => email != null && email!.isNotEmpty;

  bool get hasPhone => phone != null && phone!.isNotEmpty;

  String get displayIdentifier => email ?? phone ?? 'Unknown';

  bool get isVerified => isActive;

  User copyWith({
    int? id,
    String? email,
    String? phone,
    bool? isActive,
    String? role,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isActive: isActive ?? this.isActive,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [id, email, phone, isActive, role];

  @override
  String toString() => 'User(id: $id, email: $email, phone: $phone, isActive: $isActive, role: $role)';
}
