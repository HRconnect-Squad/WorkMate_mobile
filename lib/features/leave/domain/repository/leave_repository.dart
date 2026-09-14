import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/leave_balance.dart';
import '../entity/leave.dart';
import '../entity/leave_status.dart';
import '../entity/leave_type.dart';

abstract class LeaveRepository {
  Future<Either<Failure, List<LeaveType>>> getLeaveTypes();

  Future<Either<Failure, List<Leave>>> getMyLeaveRequests({LeaveStatus? status});

  Future<Either<Failure, Leave>> submitLeaveRequest({
    required int leaveTypeId,
    required DateTime startDate,
    required DateTime endDate,
    required String reason,
    String? attachmentPath,
  });

  Future<Either<Failure, LeaveBalanceSummary>> getLeaveBalance({int? year});

  Future<Either<Failure, bool>> cancelLeaveRequest(int id);
}