import '../../../../core/data/util/parsing.dart';
import '../../domain/entity/department.dart';
import '../../domain/entity/employee_profile.dart';
import '../../domain/entity/gender.dart';
import '../../domain/entity/manager.dart';
import '../datasource/remote/dto/department_dto.dart';
import '../datasource/remote/dto/employee_profile_dto.dart';
import '../datasource/remote/dto/request/complete_profile_request.dart';
import '../datasource/remote/dto/request/update_profile_request_dto.dart';
import '../datasource/remote/dto/manager_dto.dart';

class ProfileMapper {
  ProfileMapper._();

  static EmployeeProfile toDomain(EmployeeProfileDto dto) {
    return EmployeeProfile(
      id: dto.id ?? 0,
      employeeCode: dto.employeeCode ?? '',
      firstName: dto.firstName ?? '',
      lastName: dto.lastName ?? '',
      fullName: dto.fullName ?? '${dto.firstName ?? ''} ${dto.lastName ?? ''}'.trim(),
      phone: dto.phone,
      dateOfBirth: DataFormat.parseDate(dto.dateOfBirth),
      gender: Gender.fromString(dto.gender ?? 'unspecified'),
      address: dto.address ?? '',
      profileImage: dto.profileImage,
      jobTitle: dto.jobTitle,
      department: dto.department != null ? _mapDepartment(dto.department!) : null,
      manager: dto.manager != null ? _mapManager(dto.manager!) : null,
      hireDate: DataFormat.parseDate(dto.hireDate),
      baseSalary: _parseDouble(dto.baseSalary),
      hourlyRate: _parseDouble(dto.hourlyRate),
      employmentType: dto.employmentType ?? 'full_time',
      status: dto.status ?? 'pending',
      terminationDate: DataFormat.parseDate(dto.terminationDate),
      createdAt: DataFormat.parseDateTime(dto.createdAt),
      updatedAt: DataFormat.parseDateTime(dto.updatedAt),
    );
  }

  static Department _mapDepartment(DepartmentDto dto) {
    return Department(
      id: dto.id ?? 0,
      name: dto.name ?? '',
      managerId: dto.managerId,
      description: dto.description,
      isActive: dto.isActive ?? true,
      latitude: _parseDouble(dto.latitude),
      longitude: _parseDouble(dto.longitude),
      radiusMeters: dto.radiusMeters,
    );
  }

  static Manager _mapManager(ManagerDto dto) {
    return Manager(
      id: dto.id ?? 0,
      firstName: dto.firstName ?? '',
      lastName: dto.lastName ?? '',
    );
  }

  static double? _parseDouble(String? value) {
    if (value == null || value.isEmpty) return null;
    return double.tryParse(value);
  }

  static CompleteProfileRequestDto toCompleteProfileRequestDto({
    required String firstName,
    required String lastName,
    String? phone,
    DateTime? dateOfBirth,
    String? gender,
    String? address,
  }) {
    return CompleteProfileRequestDto(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      dateOfBirth: dateOfBirth != null ? DataFormat.formatDate(dateOfBirth) : null,
      gender: gender,
      address: address,
    );
  }

  static UpdateProfileRequestDto toUpdateProfileRequestDto({
    String? firstName,
    String? lastName,
    String? phone,
    DateTime? dateOfBirth,
    String? gender,
    String? address,
  }) {
    return UpdateProfileRequestDto(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      dateOfBirth: dateOfBirth != null ? DataFormat.formatDate(dateOfBirth) : null,
      gender: gender,
      address: address,
    );
  }
}