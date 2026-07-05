import 'package:fpdart/fpdart.dart';

import '../../../../core/config/app_constant.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../repository/auth_repository.dart';

class CheckForgotPasswordOtpUseCase {
  final AuthRepository _repository;

  const CheckForgotPasswordOtpUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required String identifier,
    required String code,
  }) {
    if (code.trim().isEmpty || code.length != AppConstant.otpLength) {
      return Future.value(Left(ValidationFailure(
        message: 'Please check your input',
        errors: ValidationErrors({
          'code': ['Please enter a valid ${AppConstant.otpLength}-digit code'],
        }),
      )));
    }

    return _repository.checkForgotPasswordOtp(identifier: identifier, code: code);
  }
}