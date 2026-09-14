import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/leave_type.dart';
import '../repository/leave_repository.dart';

class GetLeaveTypesUseCase {
  final LeaveRepository _repository;
  const GetLeaveTypesUseCase(this._repository);

  Future<Either<Failure, List<LeaveType>>> call() => _repository.getLeaveTypes();
}