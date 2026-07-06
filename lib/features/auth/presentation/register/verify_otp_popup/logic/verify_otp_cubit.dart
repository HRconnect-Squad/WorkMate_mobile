import 'package:workmate/features/auth/presentation/register/verify_otp_popup/logic/verify_otp_state.dart';
import '../../../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../../../core/presentation/util/validator.dart';
import '../../../../../../core/presentation/routes/config/app_state_notifier.dart';
import '../../../../domain/entity/verification_type.dart';
import '../../../../domain/entity/verify_otp.dart';
import '../../../../domain/use_cases/otp_use_case.dart';

class VerifyOtpCubit extends BaseCubit<VerifyOtpState> {
  final VerifyOTPUseCase _verifyOtpUseCase;

  VerifyOtpCubit(this._verifyOtpUseCase) : super(const VerifyOtpState());

  void onOtpChanged(String code) {
    updateState((s) => s.copyWith(
      code: code,
      clearError: true,
    ));
  }

  void setIdentifier(String identifier) {
    updateState((s) => s.copyWith(identifier: identifier));
  }

  bool get isOtpComplete => Validators.isOtpComplete(state.code);

  Future<void> verifyOtp({
    required VerificationType type,
  }) async {
    final otpError = Validators.validateOtp(state.code);
    if (otpError != null) {
      updateState((s) => s.copyWith(errorMessage: otpError));
      return;
    }
    if (!isOtpComplete) return;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoading: true,
        clearError: true,
      )),
      call: () => _verifyOtpUseCase(
        verifyOtp: VerifyOTP(
          identifier: state.identifier,
          code: state.code,
          type: type,
        ),
      ),
      onSuccess: (user) {
        AuthStateNotifier.instance.setLoggedIn();
        updateState((s) => s.copyWith(
          isLoading: false,
          isVerified: true,
        ));
      },
      onError: (error) {
        updateState((s) => s.copyWith(
          isLoading: false,
          errorMessage: error.message,
        ));
      },
    );
  }

  // TODO: Implement resend OTP when backend supports it
  Future<void> resendOtp() async {
  }
}
