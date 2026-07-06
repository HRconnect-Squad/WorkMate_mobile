import 'package:fpdart/fpdart.dart';
import 'package:workmate/features/auth/domain/entity/user.dart';
import 'package:workmate/features/auth/domain/repository/auth_repository.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/auth_type.dart';


class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Either<Failure, User>> call({
    required String identifier,
    required String password,
    required AuthType loginType,
    required bool isRemembered
  }) async {
    final result = await _repository.login(
      identifier: identifier,
      password: password,
      loginType: loginType,
    );

    return result.fold(
          (failure) => Left(failure),
          (user) {
        if (isRemembered) {
          _repository.saveIdentifier(identifier);
         }
          // else {
        //   _repository.clearIdentifier();
        // }
        return Right(user);
      },
    );
  }
}
