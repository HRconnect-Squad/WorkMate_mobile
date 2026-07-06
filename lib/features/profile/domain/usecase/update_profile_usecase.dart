import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/employee_profile.dart';
import '../entity/gender.dart';
import '../repository/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository _repository;

  const UpdateProfileUseCase(this._repository);

  Future<Either<Failure, EmployeeProfile>> call({
    String? firstName,
    String? lastName,
    String? phone,
    DateTime? dateOfBirth,
    Gender? gender,
    String? address,
    String? avatarPath,
  }) {
    return _repository.updateProfile(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      dateOfBirth: dateOfBirth,
      gender: gender,
      address: address,
      avatarPath: avatarPath,
    );
  }
}