import 'package:workmate/features/auth/presentation/reset_password/logic/reset_password_state.dart';
import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../core/presentation/routes/config/app_state_notifier.dart';
import '../../../../../core/presentation/util/validator.dart';
import '../../../domain/use_cases/reset_password_use_case.dart';

class ResetPasswordCubit extends BaseCubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordCubit(this._resetPasswordUseCase)
      : super(const ResetPasswordState());

  Future<void> submit() async {
    if (!_validate()) return;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(
          isLoading: true,
          clearOtpError: true,
          clearPasswordError: true,
          clearConfirmPasswordError: true,
          clearApiError: true)),
      call: () => _resetPasswordUseCase(
        identifier: state.identifier,
        code: state.otp,
        password: state.password,
        passwordConfirmation: state.confirmPassword,
      ),
      onSuccess: (user) {
        AuthStateNotifier.instance.setLoggedIn();

        updateState((s) => s.copyWith(isLoading: false, isSuccess: true, user: user));
      },
      onError: (failure) {
        updateState((s) => s.copyWith(
          isLoading: false,
          apiError: failure.message,
          isSuccess: false,
        ));
      },
    );
  }

  void onOtpChanged(String value) {
    updateState((s) => s.copyWith(
      otp: value,
      clearOtpError: true,
      clearApiError: true,
    ));
  }

  void onPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      password: value,
      clearPasswordError: true,
      clearConfirmPasswordError: true,
      clearApiError: true,
    ));
  }

  void onConfirmPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      confirmPassword: value,
      clearConfirmPasswordError: true,
      clearApiError: true,
    ));
  }

  void setIdentifier(String identifier) {
    updateState((s) => s.copyWith(identifier: identifier));
  }

  void clearError() {
    updateState((s) => s.copyWith(
        clearApiError: true,
        clearOtpError: true,
        clearPasswordError: true,
        clearConfirmPasswordError: true));
  }

  bool _validate() {
    bool isValid = true;

    final otpError = Validators.validateOtp(state.otp);
    if (otpError != null) {
      updateState((s) => s.copyWith(otpError: otpError));
      isValid = false;
    }

    final passwordError = Validators.validatePassword(state.password);
    if (passwordError != null) {
      updateState((s) => s.copyWith(passwordError: passwordError));
      isValid = false;
    }

    final confirmPasswordError = Validators.validateConfirmPassword(
      state.confirmPassword,
      state.password,
    );
    if (confirmPasswordError != null) {
      updateState((s) => s.copyWith(confirmPasswordError: confirmPasswordError));
      isValid = false;
    }

    return isValid;
  }
}