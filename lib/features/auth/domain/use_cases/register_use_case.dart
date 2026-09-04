import 'package:fpdart/fpdart.dart';
import '../../../../core/config/app_constant.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../entity/register.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  const RegisterUseCase(this._repository);

  Future<Either<Failure, Unit>> call({required Register register}) {
    final validationErrors = _validate(register);

    if (validationErrors != null) {
      return Future.value(Left(ValidationFailure(
        message: 'Please check your input',
        errors: validationErrors,
      )));
    }

    return _repository
        .register(register: register)
        .then((result) => result.map((_) => unit));
  }

  ValidationErrors? _validate(Register register) {
    final fields = <String, List<String>>{};

    if (register.email.trim().isEmpty) {
      fields['email'] = ['Email cannot be empty'];
    }

    if (register.password.length < AppConstant.passwordLength) {
      fields['password'] = [
        'Password must be at least ${AppConstant.passwordLength} characters',
      ];
    }

    if (register.password != register.passwordConfirmation) {
      fields['password_confirmation'] = ['Passwords do not match'];
    }

    if (register.phone.length < AppConstant.minPhoneNumberLength ||
        register.phone.length > AppConstant.maxPhoneNumberLength) {
      fields['phone'] = [
        'Phone must be between ${AppConstant.minPhoneNumberLength}'
            ' and ${AppConstant.maxPhoneNumberLength} digits',
      ];
    }

    return fields.isEmpty ? null : ValidationErrors(fields);
  }
}
