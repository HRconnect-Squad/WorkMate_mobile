import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/employee_profile.dart';
import '../entity/gender.dart';
import '../repository/profile_repository.dart';

class CompleteProfileUseCase {
  final ProfileRepository _repository;

  const CompleteProfileUseCase(this._repository);

  Future<Either<Failure, EmployeeProfile>> call({
    required String firstName,
    required String lastName,
    String? phone,
    DateTime? dateOfBirth,
    Gender? gender,
    String? address,
    String? profileImagePath,
  }) {
    return _repository.completeProfile(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      dateOfBirth: dateOfBirth,
      gender: gender,
      address: address,
      profileImagePath: profileImagePath,
    );
  }
}