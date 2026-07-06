import 'package:fpdart/fpdart.dart';
import 'package:workmate/features/profile/domain/entity/gender.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/employee_profile.dart';
import '../entity/office_asset.dart';
import '../entity/payroll.dart';

abstract class ProfileRepository {
  Future<Either<Failure, EmployeeProfile>> getProfile();

  Future<Either<Failure, EmployeeProfile>> completeProfile({
    required String firstName,
    required String lastName,
    String? phone,
    DateTime? dateOfBirth,
    Gender? gender,
    String? address,
    String? profileImagePath,
  });

  Future<Either<Failure, EmployeeProfile>> updateProfile({
    String? firstName,
    String? lastName,
    String? phone,
    DateTime? dateOfBirth,
    Gender? gender,
    String? address,
    String? avatarPath,
  });

  Future<Either<Failure, bool>> isProfileCompleted();
  Future<Either<Failure, String>> uploadProfileImage(String filePath);

  Future<Either<Failure, List<Payroll>>> getPayrollHistory();
  //Future<Either<Failure, Payroll>> getPayrollDetail(int id);
  Future<Either<Failure, List<OfficeAsset>>> getOfficeAssets();
}