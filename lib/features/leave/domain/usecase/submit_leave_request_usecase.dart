import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/failure/validation_error.dart';
import '../entity/leave.dart';
import '../repository/leave_repository.dart';

class SubmitLeaveRequestUseCase {
  final LeaveRepository _repository;
  const SubmitLeaveRequestUseCase(this._repository);

  Future<Either<Failure, Leave>> call({
    required int leaveTypeId,
    required DateTime startDate,
    required DateTime endDate,
    required String reason,
    String? attachmentPath,
  }) {
    final validationErrors = _validate(
      leaveTypeId: leaveTypeId,
      startDate: startDate,
      endDate: endDate,
      reason: reason,
    );

    if (validationErrors != null) {
      return Future.value(
        Left(ValidationFailure(message: 'Please check your input', errors: validationErrors)),
      );
    }

    return _repository.submitLeaveRequest(
      leaveTypeId: leaveTypeId,
      startDate: startDate,
      endDate: endDate,
      reason: reason,
      attachmentPath: attachmentPath,
    );
  }

  ValidationErrors? _validate({
    required int leaveTypeId,
    required DateTime startDate,
    required DateTime endDate,
    required String reason,
  }) {
    final fields = <String, List<String>>{};

    if (leaveTypeId <= 0) {
      fields['leave_type_id'] = ['Please select a leave type'];
    }
    if (endDate.isBefore(startDate)) {
      fields['end_date'] = ['End date must be on or after the start date'];
    }
    if (reason.trim().isEmpty) {
      fields['reason'] = ['Reason is required'];
    } else if (reason.trim().length > 1000) {
      fields['reason'] = ['Reason cannot exceed 1000 characters'];
    }

    return fields.isEmpty ? null : ValidationErrors(fields);
  }
}