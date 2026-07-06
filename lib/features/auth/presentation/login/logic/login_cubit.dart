import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../core/presentation/routes/config/app_state_notifier.dart';
import '../../../../../core/presentation/util/validator.dart';
import '../../../domain/entity/auth_type.dart';
import '../../../domain/use_cases/load_identifier_use_case.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final LoadIdentifierUseCase _loadIdentifierUseCase;

  LoginCubit(
      this._loginUseCase,
      this._loadIdentifierUseCase,
      ) : super(const LoginState()) {
    _loadSavedIdentifier();
  }

  void onIdentifierChanged(String value) {
    updateState((s) => s.copyWith(
      identifier: value,
      clearIdentifierError: true,
      clearApiError: true,
    ));
  }

  void onCountryCodeChanged(String value) {
    updateState((s) => s.copyWith(countryCode: value));
  }

  void onPasswordChanged(String value) {
    updateState((s) => s.copyWith(
      password: value,
      clearPasswordError: true,
      clearApiError: true,
    ));
  }

  void onRememberMeChanged(bool value) {
    updateState((s) => s.copyWith(rememberMe: value));
  }

  Future<void> submit(AuthType loginType) async {
    if (!_validate(loginType)) return;

    final identifier = loginType == AuthType.email
        ? state.identifier.trim()
        : state.fullPhoneNumber;

    await execute(
      onLoading: () => updateState((s) => s.copyWith(
        isLoading: true,
        clearApiError: true,
      )),
      call: () => _loginUseCase(
        identifier: identifier,
        password: state.password,
        loginType: loginType,
        isRemembered: state.rememberMe,
      ),
      onSuccess: (user) {
        AuthStateNotifier.instance.setLoggedIn();

        updateState((s) => s.copyWith(
          isLoading: false,
          isSuccess: true,
          user: user,
        ));
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

  void clearError() {
    updateState((s) => s.copyWith(
      clearApiError: true,
      clearIdentifierError: true,
      clearPasswordError: true,
    ));
  }

  Future<void> _loadSavedIdentifier() async {
    final result = await _loadIdentifierUseCase();

    result.fold(
          (failure) {
        // Silently fail - not critical
      },
          (identifier) {
        if (identifier != null && identifier.isNotEmpty) {
          updateState((s) => s.copyWith(
            savedIdentifier: identifier,
            identifier: identifier,
            rememberMe: true,
          ));
        }
      },
    );
  }

  bool _validate(AuthType loginType) {
    bool isValid = true;

    final identifierError = Validators.validateIdentifier(
      state.identifier.trim(),
      isEmail: loginType == AuthType.email,
    );

    if (identifierError != null) {
      updateState((s) => s.copyWith(identifierError: identifierError));
      isValid = false;
    }

    final passwordError = Validators.validatePassword(state.password);

    if (passwordError != null) {
      updateState((s) => s.copyWith(passwordError: passwordError));
      isValid = false;
    }

    return isValid;
  }
}