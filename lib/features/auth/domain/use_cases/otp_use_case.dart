import 'package:fpdart/fpdart.dart';
import 'package:workmate/features/auth/domain/repository/auth_repository.dart';
import '../../../../core/config/app_constant.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../entity/user.dart';
import '../entity/verify_otp.dart';

class VerifyOTPUseCase {
  final AuthRepository _repository;

  const VerifyOTPUseCase(this._repository);

  Future<Either<Failure, User>> call({required VerifyOTP verifyOtp}) {
    if (verifyOtp.code.trim().isEmpty ||
        verifyOtp.code.length != AppConstant.otpLength) {
      return Future.value(
        Left(ValidationFailure(
          message: 'Please check your input',
          errors: ValidationErrors({
            'code': [
              'Please enter a valid ${AppConstant.otpLength}-digit code',
            ],
          }),
        )),
      );
    }

    return _repository.verifyOTP(verifyOtp: verifyOtp);
  }
}
