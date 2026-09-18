import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
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

  ValidationErrors? _validate({
    required String firstName,
    required String lastName,
  }) {
    final fields = <String, List<String>>{};

    if (firstName.trim().isEmpty) {
      fields['first_name'] = ['First name cannot be empty'];
    }

    if (lastName.trim().isEmpty) {
      fields['last_name'] = ['Last name cannot be empty'];
    }

    return fields.isEmpty ? null : ValidationErrors(fields);
  }
}