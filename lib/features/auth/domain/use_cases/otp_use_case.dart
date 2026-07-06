import 'package:fpdart/fpdart.dart';
import 'package:workmate/features/auth/domain/repository/auth_repository.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/user.dart';
import '../entity/verify_otp.dart';

class VerifyOTPUseCase {
  final AuthRepository _authRepository;

  const VerifyOTPUseCase(this._authRepository);

  Future<Either<Failure, User>> call({required VerifyOTP verifyOtp}) async {
    return await _authRepository.verifyOTP(verifyOtp: verifyOtp);
  }
}
