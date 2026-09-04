import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
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
    final hasNoChanges = firstName == null &&
        lastName == null &&
        phone == null &&
        dateOfBirth == null &&
        gender == null &&
        address == null &&
        avatarPath == null;

    if (hasNoChanges) {
      return Future.value(
        const Left(ValidationFailure(message: 'No changes provided to update')),
      );
    }

    final validationErrors = _validate(
      firstName: firstName,
      lastName: lastName,
    );

    if (validationErrors != null) {
      return Future.value(Left(ValidationFailure(
        message: 'Please check your input',
        errors: validationErrors,
      )));
    }

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

  ValidationErrors? _validate({
    String? firstName,
    String? lastName,
  }) {
    final fields = <String, List<String>>{};

    if (firstName != null && firstName.trim().isEmpty) {
      fields['first_name'] = ['First name cannot be empty'];
    }

    if (lastName != null && lastName.trim().isEmpty) {
      fields['last_name'] = ['Last name cannot be empty'];
    }

    return fields.isEmpty ? null : ValidationErrors(fields);
  }
}