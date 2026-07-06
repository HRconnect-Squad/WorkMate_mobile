import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/payroll.dart';
import '../repository/profile_repository.dart';

class GetPayrollHistoryUseCase {
  final ProfileRepository _repository;

  const GetPayrollHistoryUseCase(this._repository);

  Future<Either<Failure, List<Payroll>>> call() {
    return _repository.getPayrollHistory();
  }
}