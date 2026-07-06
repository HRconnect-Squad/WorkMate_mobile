import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/config/app_constant.dart';
import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../core/presentation/routes/config/app_state_notifier.dart';
import '../../../../../core/presentation/util/validator.dart';
import '../../../domain/use_cases/change_password_use_case.dart';
import '../../../domain/use_cases/logout_use_case.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends BaseCubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;
  final LogoutUseCase _logoutUseCase;

  ChangePasswordCubit({
    required ChangePasswordUseCase changePasswordUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _changePasswordUseCase = changePasswordUseCase,
        _logoutUseCase = logoutUseCase,
        super(const ChangePasswordState());

  void onCurrentPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      currentPassword: value,
      clearCurrentPasswordError: true,
      clearError: true,
    ));
  }

  void onNewPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      newPassword: value,
      clearNewPasswordError: true,
      clearError: true,
    ));
  }

  void onConfirmPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      confirmPassword: value,
      clearConfirmPasswordError: true,
      clearError: true,
    ));
  }

  void toggleCurrentPasswordVisibility() {
    updateState((s) => s.copyWith(
      obscureCurrentPassword: !s.obscureCurrentPassword,
    ));
  }

  void toggleNewPasswordVisibility() {
    updateState((s) => s.copyWith(
      obscureNewPassword: !s.obscureNewPassword,
    ));
  }

  void toggleConfirmPasswordVisibility() {
    updateState((s) => s.copyWith(
      obscureConfirmPassword: !s.obscureConfirmPassword,
    ));
  }

  Future<void> submit() async {
    if (!_validate()) return;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoading: true,
        clearError: true,
        isSuccess: false,
      )),
      call: () => _changePasswordUseCase(
        currentPassword: state.currentPassword,
        newPassword: state.newPassword,
        newPasswordConfirmation: state.confirmPassword,
      ),
      onSuccess: (_) {
        updateState((s) => s.copyWith(
          isLoading: false,
          isSuccess: true,
        ));
        _forceLogout();
      },
      onError: (error) {
        final errorMessage = error.message.toLowerCase();

        if (errorMessage.contains('current') ||
            errorMessage.contains('wrong') ||
            errorMessage.contains('incorrect')) {
          updateState((s) => s.copyWith(
            isLoading: false,
            currentPasswordError: error.message,
          ));
        } else if (errorMessage.contains('same')) {
          updateState((s) => s.copyWith(
            isLoading: false,
            newPasswordError: error.message,
          ));
        } else {
          updateState((s) => s.copyWith(
            isLoading: false,
            error: error.message,
          ));
        }
      },
    );
  }

  bool _validate() {
    bool isValid = true;

    final currentPasswordError = Validators.validatePassword(
      state.currentPassword,
      requiredMessage: 'current_password_required'.tr(),
    );
    if (currentPasswordError != null) {
      updateState((s) => s.copyWith(currentPasswordError: currentPasswordError));
      isValid = false;
    }

    final newPasswordError = Validators.validatePasswordWithComplexity(
      state.newPassword,
      requiredMessage: 'new_password_required'.tr(),
      minLengthMessage: 'password_min_length'.tr(args: ["${AppConstant.passwordLength}"]),
    );
    if (newPasswordError != null) {
      updateState((s) => s.copyWith(newPasswordError: newPasswordError));
      isValid = false;
    }

    if (state.newPassword.isNotEmpty &&
        state.newPassword == state.currentPassword) {
      updateState((s) => s.copyWith(
        newPasswordError: 'new_password_must_be_different'.tr(),
      ));
      isValid = false;
    }

    final confirmPasswordError = Validators.validateConfirmPassword(
      state.confirmPassword,
      state.newPassword,
      requiredMessage: 'confirm_password_required'.tr(),
      mismatchMessage: 'passwords_not_match'.tr(),
    );
    if (confirmPasswordError != null) {
      updateState((s) => s.copyWith(confirmPasswordError: confirmPasswordError));
      isValid = false;
    }

    return isValid;
  }

  void clearError() {
    updateState((s) => s.copyWith(clearError: true));
  }

  void resetForm() {
    updateState((_) => const ChangePasswordState());
  }

  Future<void> _forceLogout() async {
    await _logoutUseCase.call();
    AuthStateNotifier.instance.setLoggedOut();
  }
}