import 'package:equatable/equatable.dart';

class Manager extends Equatable {
  final int id;
  final String firstName;
  final String lastName;

  const Manager({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  String get fullName => '$firstName $lastName'.trim();

  @override
  List<Object?> get props => [id, firstName, lastName];
}