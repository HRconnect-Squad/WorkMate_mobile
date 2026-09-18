import 'package:fpdart/fpdart.dart';
import 'package:workmate/features/auth/domain/entity/user.dart';
import 'package:workmate/features/auth/domain/repository/auth_repository.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../entity/auth_type.dart';

class LoginUseCase {
  final AuthRepository _repository;

  const LoginUseCase(this._repository);

  Future<Either<Failure, User>> call({
    required String identifier,
    required String password,
    required AuthType loginType,
    required bool isRemembered,
  }) async {
    final validationErrors = _validate(
      identifier: identifier,
      password: password,
    );

    if (validationErrors != null) {
      return Left(ValidationFailure(
        message: 'Please check your input',
        errors: validationErrors,
      ));
    }

    final result = await _repository.login(
      identifier: identifier,
      password: password,
      loginType: loginType,
    );

    if (result.isRight() && isRemembered) {
      _repository.saveIdentifier(identifier);
    }

    return result;
  }

  ValidationErrors? _validate({
    required String identifier,
    required String password,
  }) {
    final fields = <String, List<String>>{};

    if (identifier.trim().isEmpty) {
      fields['identifier'] = ['Email or phone cannot be empty'];
    }

    if (password.trim().isEmpty) {
      fields['password'] = ['Password cannot be empty'];
    }

    return fields.isEmpty ? null : ValidationErrors(fields);
  }
}
