import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/leave_balance.dart';
import '../repository/leave_repository.dart';

class GetLeaveBalanceUseCase {
  final LeaveRepository _repository;
  const GetLeaveBalanceUseCase(this._repository);

  Future<Either<Failure, LeaveBalanceSummary>> call({int? year}) => _repository.getLeaveBalance(year: year);
}