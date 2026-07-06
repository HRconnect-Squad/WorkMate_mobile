import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:workmate/core/domain/failure/domain_failure.dart';
import '../../../features/auth/domain/failures/failure.dart';
import '../../../features/expense/domain/failure/expense_failure.dart';
import '../../../features/profile/domain/failure/failure.dart';
import '../../../features/profile/domain/failure/payroll_failure.dart';
import '../exception/ui_errors.dart';

abstract class BaseCubit<STATE> extends Cubit<STATE> {
  BaseCubit(super.initialState);

  Future<void> execute<T>({
    required Future<Either<Failure, T>> Function() call,
    required void Function(T result) onSuccess,
    required void Function(UiError error) onError,
    void Function()? onLoading,
  }) async {
    onLoading?.call();

    final result = await call();

    result.fold((failure) {
      final uiError = _mapFailureToUiError(failure);
      onError(uiError);

      if (failure is SessionExpiredFailure ||
          failure is InvalidCredentialsFailure) {
        if (failure is SessionExpiredFailure) {
          _handleUnauthorized();
        }
      }
    }, (data) => onSuccess(data));
  }

  void updateState(STATE Function(STATE currentState) updater) {
    emit(updater(state));
  }

  UiError _mapFailureToUiError(Failure failure) {
    return switch (failure) {
      NetworkFailure() => const NetworkUiError(),
      TimeoutFailure() => const TimeoutUiError(),
      ServerFailure(:final message) => ServerUiError(message),
      CacheFailure(:final message) => CacheUiError(message),
      InvalidCredentialsFailure(:final message) => InvalidCredentialsUiError(message,),
      SessionExpiredFailure(:final message) => UnauthorizedUiError(message),
      UserNotFoundFailure(:final message) => NotFoundUiError(message),
      InvalidOtpFailure(:final message) => InvalidOtpUiError(message),
      OtpExpiredFailure(:final message) => InvalidOtpUiError(message),
      EmailAlreadyExistsFailure(:final message) => AccountExistsUiError(message,),
      PhoneAlreadyExistsFailure(:final message) => AccountExistsUiError(message,),
      AccountNotVerifiedFailure(:final message) => AccountNotVerifiedUiError(message,),
      AccountDisabledFailure(:final message) => AccountDisabledUiError(message),
      TooManyAttemptsFailure(:final message) => TooManyAttemptsUiError(message),

      ValidationFailure(:final message, :final fieldErrors) =>
        ValidationUiError(message: message, fieldErrors: fieldErrors),

      ProfileUpdateFailure(:final message) => ProfileUpdateUiError(message),
      ProfileNotCompletedFailure(:final message) => ProfileNotCompletedUiError(message),
      ProfileFetchFailure(:final message) => ProfileFetchUiError(message),
      ProfileImageUploadFailure(:final message) => ProfileImageUploadUiError(message),

      PayrollFetchFailure(:final message) => PayrollFetchUiError(message),
      PayrollNotFoundFailure(:final message) => PayrollNotFoundUiError(message),

      ProfileAlreadyExistsFailure(:final message) => ProfileAlreadyExistsUiError(message),

      ChangePasswordFailure(:final message) => ChangePasswordUiError(message),
      SamePasswordFailure(:final message) => SamePasswordUiError(message),
      InvalidCurrentPasswordFailure(:final message) => InvalidCurrentPasswordUiError(message),

      ExpenseFetchFailure(:final message) => ExpenseFetchUiError(message),
      ExpenseNotFoundFailure(:final message) => ExpenseNotFoundUiError(message),
      ExpenseAlreadyProcessedFailure(:final message) => ExpenseAlreadyProcessedUiError(message),
      ExpenseCreateFailure(:final message) => ExpenseCreateUiError(message),
      ExpenseUpdateFailure(:final message) => ExpenseUpdateUiError(message),
      ExpenseDeleteFailure(:final message) => ExpenseDeleteUiError(message),
      ReceiptUploadFailure(:final message) => ReceiptUploadUiError(message),
      ExpenseValidationFailure(:final message, :final fieldErrors) =>
      ValidationUiError(message: message, fieldErrors: fieldErrors),
      UnknownFailure(:final message) => UnknownUiError(message),
      _ => const UnknownUiError("Unknown error occurred")
    };
  }

  void _handleUnauthorized() {
    // Override in app-level base cubit or specific cubits
  }
}
