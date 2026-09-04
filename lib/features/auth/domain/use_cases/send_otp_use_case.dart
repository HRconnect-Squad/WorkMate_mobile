import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../entity/auth_type.dart';
import '../entity/verification_type.dart';
import '../repository/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository _repository;

  const SendOtpUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String identifier,
    required AuthType loginType,
    required VerificationType purpose,
  }) {
    if (identifier.trim().isEmpty) {
      return Future.value(Left(ValidationFailure(
        message: 'Please check your input',
        errors: ValidationErrors({
          'identifier': ['Email or phone cannot be empty'],
        }),
      )));
    }

    return _repository.sendOtp(
      identifier: identifier,
      loginType: loginType,
      purpose: purpose,
    );
  }
}