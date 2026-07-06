import 'package:equatable/equatable.dart';

class DepartmentDto extends Equatable {
  final int? id;
  final String? name;
  final int? managerId;
  final String? description;
  final bool? isActive;
  final String? latitude;
  final String? longitude;
  final int? radiusMeters;
  final String? createdAt;
  final String? updatedAt;

  const DepartmentDto({
    this.id,
    this.name,
    this.managerId,
    this.description,
    this.isActive,
    this.latitude,
    this.longitude,
    this.radiusMeters,
    this.createdAt,
    this.updatedAt,
  });

  factory DepartmentDto.fromJson(Map<String, dynamic> json) {
    return DepartmentDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      managerId: json['manager_id'] as int?,
      description: json['description'] as String?,
      isActive: json['is_active'] as bool?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      radiusMeters: json['radius_meters'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'manager_id': managerId,
      'description': description,
      'is_active': isActive,
      'latitude': latitude,
      'longitude': longitude,
      'radius_meters': radiusMeters,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

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
    createdAt,
    updatedAt,
  ];
}