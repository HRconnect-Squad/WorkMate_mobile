import '../remote/dto/employee_profile_dto.dart';

abstract class ProfileLocalDataSource {
  Future<EmployeeProfileDto?> getCachedProfile();

  Future<void> cacheProfile(EmployeeProfileDto profile);

  Future<void> clearCache();

  Future<bool> isProfileCompleted();

  Future<void> setProfileCompleted(bool completed);
}