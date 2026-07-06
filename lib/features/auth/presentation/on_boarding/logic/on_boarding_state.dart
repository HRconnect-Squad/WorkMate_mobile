import 'package:equatable/equatable.dart';

enum OnboardingStatus { initial, loading, completed, error }

enum AuthDestination { login, register }

class OnboardingState extends Equatable {
  final int currentIndex;
  final OnboardingStatus status;
  final AuthDestination? destination;
  final String? errorMessage;

  const OnboardingState({
    this.currentIndex = 0,
    this.status = OnboardingStatus.initial,
    this.destination,
    this.errorMessage,
  });

  static const int totalPages = 4;

  bool get isFinalPage => currentIndex == totalPages - 1;

  bool get isLoading => status == OnboardingStatus.loading;

  bool get shouldNavigate =>
      status == OnboardingStatus.completed && destination != null;

  OnboardingState copyWith({
    int? currentIndex,
    OnboardingStatus? status,
    AuthDestination? destination,
    String? errorMessage,
    bool clearDestination = false,
    bool clearError = false,
  }) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
      destination: clearDestination ? null : (destination ?? this.destination),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [currentIndex, status, destination, errorMessage];
}