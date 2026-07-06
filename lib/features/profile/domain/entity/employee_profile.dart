import 'package:equatable/equatable.dart';
import 'department.dart';
import 'gender.dart';
import 'manager.dart';

class EmployeeProfile extends Equatable {
  final int id;
  final String employeeCode;
  final String firstName;
  final String lastName;
  final String fullName;
  final String? phone;
  final String? emailAddress;
  final DateTime? dateOfBirth;
  final Gender gender;
  final String address;
  final String? profileImage;
  final String? jobTitle;
  final Department? department;
  final Manager? manager;
  final DateTime? hireDate;
  final double? baseSalary;
  final double? hourlyRate;
  final String employmentType;
  final String status;
  final DateTime? terminationDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const EmployeeProfile({
    required this.id,
    required this.employeeCode,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    this.phone,
    this.emailAddress,
    this.dateOfBirth,
    required this.gender,
    required this.address,
    this.profileImage,
    this.jobTitle,
    this.department,
    this.manager,
    this.hireDate,
    this.baseSalary,
    this.hourlyRate,
    required this.employmentType,
    required this.status,
    this.terminationDate,
    this.createdAt,
    this.updatedAt,
  });

  bool get isActive => status.toLowerCase() == 'active';

  bool get isPending => status.toLowerCase() == 'pending';

  bool get isEmailType => emailAddress != null;

  bool get isPhoneType => phone != null;


  String get formattedSalary {
    if (baseSalary == null) return 'Not specified';
    return '${baseSalary!.toStringAsFixed(2)}';
  }

  String get formattedGender {
    return gender.name[0].toUpperCase() + gender.name.substring(1);
  }

  String get formattedDateOfBirth {
    if (dateOfBirth == null) return 'Not specified';
    return '${hireDate!.day}/${hireDate!.month}/${hireDate!.year}';
  }

  String get formattedHireDate {
    if (hireDate == null) return 'Not specified';
    return '${hireDate!.day}/${hireDate!.month}/${hireDate!.year}';
  }

  String get formattedJobTitle => jobTitle ?? 'Employee';

  String get formattedDepartment => department?.name ?? 'Not assigned';

  String get formattedManager => manager?.fullName ?? 'Not assigned';

  bool get isProfileComplete {
    return firstName.isNotEmpty && lastName.isNotEmpty;
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

  EmployeeProfile copyWith({
    int? id,
    String? employeeCode,
    String? firstName,
    String? lastName,
    String? fullName,
    String? phone,
    DateTime? dateOfBirth,
    Gender? gender,
    String? address,
    String? profileImage,
    String? jobTitle,
    Department? department,
    Manager? manager,
    DateTime? hireDate,
    double? baseSalary,
    double? hourlyRate,
    String? employmentType,
    String? status,
    DateTime? terminationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EmployeeProfile(
      id: id ?? this.id,
      employeeCode: employeeCode ?? this.employeeCode,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
      jobTitle: jobTitle ?? this.jobTitle,
      department: department ?? this.department,
      manager: manager ?? this.manager,
      hireDate: hireDate ?? this.hireDate,
      baseSalary: baseSalary ?? this.baseSalary,
      hourlyRate: hourlyRate ?? this.hourlyRate,
      employmentType: employmentType ?? this.employmentType,
      status: status ?? this.status,
      terminationDate: terminationDate ?? this.terminationDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}