import '../../../../core/domain/failure/domain_failure.dart';

sealed class LeaveFailure extends Failure {
  const LeaveFailure({required super.message, super.statusCode, super.errorCode});
}

class InsufficientLeaveBalanceFailure extends LeaveFailure {
  final int? requestedDays;
  final int? remainingBalance;

  const InsufficientLeaveBalanceFailure({
    super.message = 'Insufficient leave balance',
    this.requestedDays,
    this.remainingBalance,
  });
}

class LeaveOverlapFailure extends LeaveFailure {
  const LeaveOverlapFailure({super.message = 'You already have a leave request for this period'});
}

class LeaveRequestNotFoundFailure extends LeaveFailure {
  const LeaveRequestNotFoundFailure({
    super.message = 'Leave request not found',
  });
}

class LeaveAlreadyProcessedFailure extends LeaveFailure {
  const LeaveAlreadyProcessedFailure({
    super.message = 'This leave request has already been processed and cannot be modified',
  });
}

class NoWorkingDaysInRangeFailure extends LeaveFailure {
  const NoWorkingDaysInRangeFailure({
    super.message = 'The selected date range contains no working days',
  });
}