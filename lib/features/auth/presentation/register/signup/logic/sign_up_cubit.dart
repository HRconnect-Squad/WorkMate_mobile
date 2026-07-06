import '../../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../../core/presentation/util/validator.dart';
import '../../../../domain/entity/auth_type.dart';
import '../../../../domain/entity/register.dart';
import '../../../../domain/use_cases/register_use_case.dart';
import 'sign_up_state.dart';

class SignUpCubit extends BaseCubit<SignUpState> {
  final RegisterUseCase _registerUseCase;

  SignUpCubit(this._registerUseCase) : super(const SignUpState());

  void onEmailChanged(String value) {
    updateState((s) => s.copyWith(
      email: value,
      clearEmailError: true,
      clearApiError: true,
    ));
  }

  void onPhoneChanged(String value) {
    updateState((s) => s.copyWith(
      phone: value,
      clearPhoneError: true,
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

  void onCountryCodeChanged(String code) {
    updateState((s) => s.copyWith(countryCode: code));
  }

  void onTermsToggled(bool value) {
    updateState((s) => s.copyWith(isCheckedTermsAndConditions: value));
  }

  void togglePasswordVisibility() {
    updateState((s) => s.copyWith(isObscurePassword: !s.isObscurePassword));
  }

  void toggleConfirmPasswordVisibility() {
    updateState((s) => s.copyWith(isObscureConfirmPassword: !s.isObscureConfirmPassword));
  }

  Future<void> submit() async {
    if (!_validate()) return;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoading: true,
        clearApiError: true,
      )),
      call: () => _registerUseCase(
        register: Register(
          email: state.email.trim(),
          phone: state.fullPhoneNumber,
          password: state.password,
          passwordConfirmation: state.confirmPassword,
          authType: AuthType.email,
        ),
      ),
      onSuccess: (_) {
        updateState((s) => s.copyWith(
          isLoading: false,
          isRegistered: true,
        ));
      },
      onError: (error) {
        updateState((s) => s.copyWith(
          isLoading: false,
          apiError: error.message,
        ));
      },
    );
  }


  bool _validate() {
    bool isValid = true;

    final emailError = Validators.validateEmail(state.email.trim());
    if (emailError != null) {
      updateState((s) => s.copyWith(emailError: emailError));
      isValid = false;
    }

    final phoneError = Validators.validatePhone(state.phone.trim());
    if (phoneError != null) {
      updateState((s) => s.copyWith(phoneError: phoneError));
      isValid = false;
    }

    final passwordError = Validators.validatePasswordWithComplexity(state.password);
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