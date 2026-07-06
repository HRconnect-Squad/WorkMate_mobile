import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
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
    return _repository.resetPassword(
      identifier: identifier,
      code: code,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
