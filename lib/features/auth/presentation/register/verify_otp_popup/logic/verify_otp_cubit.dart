import '../../../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../../../core/presentation/util/validator.dart';
import '../../../../../../core/presentation/routes/config/app_state_notifier.dart';
import '../../../../domain/entity/auth_identifier.dart';
import '../../../../domain/entity/verification_type.dart';
import '../../../../domain/entity/verify_otp.dart';
import '../../../../domain/failures/failure.dart';
import '../../../../domain/use_cases/otp_use_case.dart';
import '../../../../domain/use_cases/send_otp_use_case.dart';
import '../../../mapper/auth_failure_ui_mapper.dart';
import 'verify_otp_state.dart';

class VerifyOtpCubit extends BaseCubit<VerifyOtpState> {
  final VerifyOTPUseCase _verifyOtpUseCase;
  final SendOtpUseCase _sendOtpUseCase;

  VerifyOtpCubit(this._verifyOtpUseCase, this._sendOtpUseCase)
      : super(const VerifyOtpState());

  void setIdentifier(AuthIdentifier identifier) {
    updateState((s) => s.copyWith(identifier: identifier));
  }

  void onOtpChanged(String code) {
    updateState((s) => s.copyWith(code: code, clearError: true));
  }

  bool get isOtpComplete => Validators.isOtpComplete(state.code);

  Future<void> verifyOtp({required VerificationType type}) async {
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
          identifier: state.identifier.value,
          code: state.code,
          type: type,
        ),
      ),
      onSuccess: (user) {
        AuthStateNotifier.instance.setLoggedIn();
        updateState((s) => s.copyWith(isLoading: false, isVerified: true));
      },
      onError: (failure) {
        switch (failure) {
          case InvalidOtpFailure():
            updateState((s) => s.copyWith(
              isLoading: false,
              code: '',
              errorMessage: AuthFailureUiMapper.map(failure),
            ));

          default:
            updateState((s) => s.copyWith(
              isLoading: false,
              errorMessage: AuthFailureUiMapper.map(failure),
            ));
        }
      },
    );
  }

  Future<void> resendOtp() async {
    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isResending: true,
        clearError: true,
      )),
      call: () => _sendOtpUseCase(
        identifier: state.identifier.value,
        loginType: state.identifier.type,
        purpose: VerificationType.registration,
      ),
      onSuccess: (_) {
        updateState((s) => s.copyWith(isResending: false, code: ''));
      },
      onError: (failure) {
        updateState((s) => s.copyWith(
          isResending: false,
          errorMessage: AuthFailureUiMapper.map(failure),
        ));
      },
    );
  }
}