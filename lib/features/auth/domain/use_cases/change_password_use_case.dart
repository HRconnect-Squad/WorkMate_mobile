import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository _repository;

  const ChangePasswordUseCase(this._repository);

  Future<Either<Failure, bool>> call({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) {
    return _repository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );
  }
}