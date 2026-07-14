import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:workmate/core/domain/failure/domain_failure.dart';
import '../routes/config/app_state_notifier.dart';

abstract class BaseCubit<STATE> extends Cubit<STATE> {
  final AuthStateNotifier _authStateNotifier;

  BaseCubit(super.initialState, {AuthStateNotifier? authStateNotifier})
      : _authStateNotifier = authStateNotifier ?? AuthStateNotifier.instance;

  Future<void> execute<T>({
    required Future<Either<Failure, T>> Function() call,
    required void Function(T result) onSuccess,
    required void Function(Failure error) onError,
    void Function()? onLoading,
  }) async {
    onLoading?.call();

    final result = await call();

    result.fold(
          (failure) {
        onError(failure);

        if (failure is RequiresReauthentication) {
          onSessionExpired();
        }
      },
        (result) => onSuccess(result),
    );
  }

  void updateState(STATE Function(STATE currentState) updater) {
    emit(updater(state));
  }

  @protected
  void onSessionExpired() {
    _authStateNotifier.setLoggedOut();
  }
}
