import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/leave_repository.dart';

class CancelLeaveRequestUseCase {
  final LeaveRepository _repository;
  const CancelLeaveRequestUseCase(this._repository);

  Future<Either<Failure, bool>> call(int id) => _repository.cancelLeaveRequest(id);
}