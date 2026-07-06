import 'package:equatable/equatable.dart';

class ManagerDto extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;

  const ManagerDto({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory ManagerDto.fromJson(Map<String, dynamic> json) {
    return ManagerDto(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  String get fullName {
    final first = firstName ?? '';
    final last = lastName ?? '';
    return '$first $last'.trim();
  }

  @override
  List<Object?> get props => [id, firstName, lastName];
}