import 'package:fpdart/fpdart.dart';
import 'package:workmate/features/profile/domain/entity/office_asset.dart';
import 'package:workmate/features/profile/domain/entity/payroll.dart';
import '../../../../core/ services/logger_service.dart';
import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/employee_profile.dart';
import '../../domain/entity/gender.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasource/local/profile_local_data_source.dart';
import '../datasource/remote/profile_remote_data_source.dart';
import '../mapper/office_assets_mapper.dart';
import '../mapper/payroll_failure_mapper.dart';
import '../mapper/payroll_mapper.dart';
import '../mapper/profile_failure_mapper.dart';
import '../mapper/profile_mapper.dart';

class ProfileRepositoryImpl with SafeApiCall implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final ProfileLocalDataSource _localDataSource;

  const ProfileRepositoryImpl({
    required ProfileRemoteDataSource remoteDataSource,
    required ProfileLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  // ─── Remote Operations ────────────────────────────────────────────────────
  @override
  Future<Either<Failure, EmployeeProfile>> getProfile() =>
      safeApiCall(
        call: () async {
          final dto = await _remoteDataSource.getProfile();
          final profile = ProfileMapper.toDomain(dto);
          await _localDataSource.cacheProfile(dto).catchError((_) {});
          await _localDataSource
              .setProfileCompleted(profile.isProfileComplete)
              .catchError((e) => logger.e('Failed to cache profile',e ));

          return profile;
        },
        onException: ProfileFailureMapper.fromException,
      );

  @override
  Future<Either<Failure, EmployeeProfile>> completeProfile({
    required String firstName,
    required String lastName,
    String? phone,
    DateTime? dateOfBirth,
    Gender? gender,
    String? address,
    String? profileImagePath,
  }) =>
      safeApiCall(
        call: () async {
          final request = ProfileMapper.toCompleteProfileRequestDto(
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            dateOfBirth: dateOfBirth,
            gender: gender?.name == 'unspecified' ? null : gender?.name,
            address: address,
          );

          await _remoteDataSource.completeProfile(
            request: request,
            profileImagePath: profileImagePath,
          );

          //final profile = ProfileMapper.toDomain(dto);

          final fullDto = await _remoteDataSource.getProfile();
          final profile = ProfileMapper.toDomain(fullDto);

          await _localDataSource.cacheProfile(fullDto)
              .catchError((e) => logger.e('Failed to cache profile', e));
          await _localDataSource.setProfileCompleted(true).catchError((_) {});

          return profile;
        },
        onException: ProfileFailureMapper.fromException,
      );

  @override
  Future<Either<Failure, EmployeeProfile>> updateProfile({
    String? firstName,
    String? lastName,
    String? phone,
    DateTime? dateOfBirth,
    Gender? gender,
    String? address,
    String? avatarPath,
  }) =>
      safeApiCall(
        call: () async {
          final request = ProfileMapper.toUpdateProfileRequestDto(
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            dateOfBirth: dateOfBirth,
            gender: gender?.name,
            address: address,
          );

          await _remoteDataSource.updateProfile(
            request: request,
            avatarPath: avatarPath,
          );

         // final profile = ProfileMapper.toDomain(dto);

          final fullDto = await _remoteDataSource.getProfile();
          final profile = ProfileMapper.toDomain(fullDto);

          await _localDataSource.cacheProfile(fullDto)
              .catchError((e) => logger.e('Failed to cache profile', e));

          return profile;
        },
        onException: ProfileFailureMapper.fromException,
      );

  @override
  Future<Either<Failure, String>> uploadProfileImage(String filePath) =>
      safeApiCall(
        call: () async {
          final response = await _remoteDataSource.uploadProfileImage(filePath);
          return response.url;
        },
        onException: ProfileFailureMapper.fromException,
      );

  @override
  Future<Either<Failure, List<Payroll>>> getPayrollHistory() =>
      safeApiCall(
        call: () async {
          final dtos = await _remoteDataSource.getPayrollHistory();
          return PayrollMapper.toDomainList(dtos);
        },
        onException: PayrollFailureMapper.fromException,
      );

  @override
  Future<Either<Failure, List<OfficeAsset>>> getOfficeAssets() =>
      safeApiCall(
        call: () async {
          final dtos = await _remoteDataSource.getOfficeAssets();
          return dtos.map(OfficeAssetsMapper.toDomain).toList();
        },
        onException: ProfileFailureMapper.fromException,
      );

  // ─── Local / Cache Operations ─────────────────────────────────────────────
  @override
  Future<Either<Failure, bool>> isProfileCompleted() =>
      safeCacheCall(
        call: () => _localDataSource.isProfileCompleted(),
      );
}