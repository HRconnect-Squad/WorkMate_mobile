import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/leave.dart';
import '../entity/leave_status.dart';
import '../repository/leave_repository.dart';

class GetMyLeaveRequestsUseCase {
  final LeaveRepository _repository;
  const GetMyLeaveRequestsUseCase(this._repository);

  Future<Either<Failure, List<Leave>>> call({LeaveStatus? status}) =>
      _repository.getMyLeaveRequests(status: status);
}