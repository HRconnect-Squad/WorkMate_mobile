import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final int id;
  final String name;
  final int? managerId;
  final String? description;
  final bool isActive;
  final double? latitude;
  final double? longitude;
  final int? radiusMeters;

  const Department({
    required this.id,
    required this.name,
    this.managerId,
    this.description,
    this.isActive = true,
    this.latitude,
    this.longitude,
    this.radiusMeters,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    managerId,
    description,
    isActive,
    latitude,
    longitude,
    radiusMeters,
  ];
}