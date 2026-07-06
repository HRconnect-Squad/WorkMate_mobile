import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/auth_type.dart';
import '../repository/auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository _repository;

  const ForgotPasswordUseCase(this._repository);


  Future<Either<Failure, String>> call({
    required String identifier,
    required AuthType loginType,
  }) {
    return _repository.forgotPassword(
      identifier: identifier,
      loginType: loginType,
    );
  }
}