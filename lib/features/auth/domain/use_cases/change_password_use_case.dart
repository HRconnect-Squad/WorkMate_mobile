import 'package:fpdart/fpdart.dart';
import '../../../../core/config/app_constant.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../repository/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository _repository;

  const ChangePasswordUseCase(this._repository);

  Future<Either<Failure, bool>> call({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) {
    final validationErrors = _validate(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );

    if (validationErrors != null) {
      return Future.value(Left(ValidationFailure(
        message: 'Please check your input',
        errors: validationErrors,
      )));
    }

    return _repository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );
  }

  ValidationErrors? _validate({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) {
    final fields = <String, List<String>>{};

    if (currentPassword.trim().isEmpty) {
      fields['current_password'] = ['Current password cannot be empty'];
    }

    if (newPassword.length < AppConstant.passwordLength) {
      fields['new_password'] = [
        'Password must be at least ${AppConstant.passwordLength} characters',
      ];
    }

    if (newPassword != newPasswordConfirmation) {
      fields['new_password_confirmation'] = ['Passwords do not match'];
    }

    if (newPassword == currentPassword) {
      fields['new_password'] = [
        'New password must be different from current password',
      ];
    }

    return fields.isEmpty ? null : ValidationErrors(fields);
  }
}