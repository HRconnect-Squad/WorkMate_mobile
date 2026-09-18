import 'package:fpdart/fpdart.dart';
import '../../../../core/config/app_constant.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository _repository;

  const ResetPasswordUseCase(this._repository);

  Future<Either<Failure, User>> call({
    required String identifier,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) {
    final validationErrors = _validate(
      code: code,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    if (validationErrors != null) {
      return Future.value(Left(ValidationFailure(
        message: 'Please check your input',
        errors: validationErrors,
      )));
    }

    return _repository.resetPassword(
      identifier: identifier,
      code: code,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }

  ValidationErrors? _validate({
    required String code,
    required String password,
    required String passwordConfirmation,
  }) {
    final fields = <String, List<String>>{};

    if (code.trim().isEmpty || code.length != AppConstant.otpLength) {
      fields['code'] = ['Please enter a valid ${AppConstant.otpLength}-digit code'];
    }

    if (password.length < AppConstant.passwordLength) {
      fields['password'] = [
        'Password must be at least ${AppConstant.passwordLength} characters',
      ];
    }

    if (password != passwordConfirmation) {
      fields['password_confirmation'] = ['Passwords do not match'];
    }

    return fields.isEmpty ? null : ValidationErrors(fields);
  }
}
