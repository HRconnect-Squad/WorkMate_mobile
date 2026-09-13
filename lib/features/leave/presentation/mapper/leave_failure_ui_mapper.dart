import 'package:easy_localization/easy_localization.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/presentation/mapper/failure_ui_mapper.dart';
import '../../domain/failure/leave_failure.dart';

class LeaveFailureUiMapper {
  const LeaveFailureUiMapper._();

  static String map(Failure failure) {
    return switch (failure) {
      InsufficientLeaveBalanceFailure(:final remainingBalance) =>
      remainingBalance != null
          ? 'insufficient_leave_balance_with_remaining'.tr(args: [remainingBalance.toString()])
          : 'insufficient_leave_balance_error'.tr(),
      LeaveRequestNotFoundFailure() => 'leave_request_not_found_error'.tr(),
      LeaveOverlapFailure() => 'leave_overlap_error'.tr(),
      LeaveAlreadyProcessedFailure() => 'leave_already_processed_error'.tr(),
      _ => FailureUiMapper.map(failure),
    };
  }
}