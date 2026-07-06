import 'package:fpdart/fpdart.dart';
import '../../../../../core/presentation/base_viewmodel/base_cubit.dart';
import '../../../../../core/presentation/routes/config/app_state_notifier.dart';
import '../../../domain/use_cases/complete_onboarding_use_case.dart';
import 'on_boarding_state.dart';


class OnboardingCubit extends BaseCubit<OnboardingState> {
  final CompleteOnboardingUseCase _completeOnboardingUseCase;

  OnboardingCubit({
    required CompleteOnboardingUseCase completeOnboardingUseCase,
  })  : _completeOnboardingUseCase = completeOnboardingUseCase,
        super(const OnboardingState());

  void onNextPressed() {
    if (!state.isFinalPage) {
      updateState((s) => s.copyWith(currentIndex: s.currentIndex + 1));
    }
  }

  void onSkipPressed() {
    updateState((s) => s.copyWith(
      currentIndex: OnboardingState.totalPages - 1,
    ));
  }

  void onPageChanged(int index) {
    updateState((s) => s.copyWith(currentIndex: index));
  }

  Future<void> onSignInPressed() async {
    await _completeAndNavigate(AuthDestination.login);
  }

  Future<void> onRegisterPressed() async {
    await _completeAndNavigate(AuthDestination.register);
  }

  Future<void> _completeAndNavigate(AuthDestination destination) async {
    await execute<Unit>(
      onLoading: () => updateState((s) => s.copyWith(
        status: OnboardingStatus.loading,
        clearError: true,
      )),
      call: _completeOnboardingUseCase.call,
      onSuccess: (_) {
        updateState((s) => s.copyWith(
          status: OnboardingStatus.completed,
          destination: destination,
        ));
        AuthStateNotifier.instance.setOnboardingCompleted();
      },
      onError: (error) => updateState((s) => s.copyWith(
        status: OnboardingStatus.error,
        errorMessage: error.message,
      )),
    );
  }

  void onNavigationHandled() {
    updateState((s) => s.copyWith(clearDestination: true));
  }
}