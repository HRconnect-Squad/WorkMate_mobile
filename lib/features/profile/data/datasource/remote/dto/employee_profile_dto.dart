import 'package:equatable/equatable.dart';

import 'department_dto.dart';
import 'manager_dto.dart';

class EmployeeProfileDto extends Equatable {
  final int? id;
  final String? employeeCode;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? phone;
  final String? dateOfBirth;
  final String? gender;
  final String? address;
  final String? profileImage;
  final String? jobTitle;
  final DepartmentDto? department;
  final ManagerDto? manager;
  final String? hireDate;
  final String? baseSalary;
  final String? hourlyRate;
  final String? employmentType;
  final String? status;
  final String? terminationDate;
  final String? createdAt;
  final String? updatedAt;

  const EmployeeProfileDto({
    this.id,
    this.employeeCode,
    this.firstName,
    this.lastName,
    this.fullName,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.address,
    this.profileImage,
    this.jobTitle,
    this.department,
    this.manager,
    this.hireDate,
    this.baseSalary,
    this.hourlyRate,
    this.employmentType,
    this.status,
    this.terminationDate,
    this.createdAt,
    this.updatedAt,
  });

  factory EmployeeProfileDto.fromJson(Map<String, dynamic> json) {
    return EmployeeProfileDto(
      id: json['id'] as int?,
      employeeCode: json['employee_code'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullName: json['full_name'] as String?,
      phone: json['phone'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      profileImage: json['profile_image'] as String?,
      jobTitle: json['job_title'] as String?,
      department: json['department'] != null
          ? DepartmentDto.fromJson(json['department'] as Map<String, dynamic>)
          : null,
      manager: json['manager'] != null
          ? ManagerDto.fromJson(json['manager'] as Map<String, dynamic>)
          : null,
      hireDate: json['hire_date'] as String?,
      baseSalary: _parseToString(json['base_salary']),
      hourlyRate: _parseToString(json['hourly_rate']),
      employmentType: json['employment_type'] as String?,
      status: json['status'] as String?,
      terminationDate: json['termination_date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  static String? _parseToString(dynamic value) {
    if (value == null) return null;
    return value.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_code': employeeCode,
      'first_name': firstName,
      'last_name': lastName,
      'full_name': fullName,
      'phone': phone,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'address': address,
      'profile_image': profileImage,
      'job_title': jobTitle,
      'department': department?.toJson(),
      'manager': manager?.toJson(),
      'hire_date': hireDate,
      'base_salary': baseSalary,
      'hourly_rate': hourlyRate,
      'employment_type': employmentType,
      'status': status,
      'termination_date': terminationDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  List<Object?> get props => [
    id,
    employeeCode,
    firstName,
    lastName,
    fullName,
    phone,
    dateOfBirth,
    gender,
    address,
    profileImage,
    jobTitle,
    department,
    manager,
    hireDate,
    baseSalary,
    hourlyRate,
    employmentType,
    status,
    terminationDate,
    createdAt,
    updatedAt,
  ];
}