import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../core/presentation/util/validator.dart';
import '../../../domain/entity/auth_type.dart';
import '../../../domain/entity/verification_type.dart';
import '../../../domain/failures/failure.dart';
import '../../../domain/use_cases/send_otp_use_case.dart';
import '../../mapper/auth_failure_ui_mapper.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends BaseCubit<ForgotPasswordState> {
  final SendOtpUseCase _sendOtpUseCase;

  ForgotPasswordCubit(this._sendOtpUseCase) : super(const ForgotPasswordState());

  Future<void> submit() async {
    if (!_validate()) return;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoading: true,
        clearEmailError: true,
        isSuccess: false,
        clearApiError: true,
      )),
      call: () => _sendOtpUseCase(
        identifier: state.email.trim(),
        loginType: AuthType.email,
        purpose: VerificationType.passwordReset,
      ),
      onSuccess: (identifier) {
        updateState((s) => s.copyWith(
          isLoading: false,
          isSuccess: true,
          successIdentifier: identifier,
        ));
      },
      onError: (failure) {
        switch (failure) {
          case UserNotFoundFailure():
            updateState((s) => s.copyWith(
              isLoading: false,
              emailError: AuthFailureUiMapper.map(failure),
              isSuccess: false,
            ));

          default:
            updateState((s) => s.copyWith(
              isLoading: false,
              apiError: AuthFailureUiMapper.map(failure),
              isSuccess: false,
            ));
        }
      },
    );
  }

  void reset() {
    updateState((s) => s == const ForgotPasswordState() ? s : const ForgotPasswordState());
  }

  void onEmailChanged(String value) {
    updateState((s) => s.copyWith(
      email: value,
      clearEmailError: true,
      clearApiError: true,
    ));
  }

  void clearError() {
    updateState((s) => s.copyWith(clearApiError: true, clearEmailError: true));
  }

  bool _validate() {
    final emailError = Validators.validateEmail(state.email.trim());
    if (emailError != null) {
      updateState((s) => s.copyWith(emailError: emailError));
      return false;
    }
    return true;
  }
}