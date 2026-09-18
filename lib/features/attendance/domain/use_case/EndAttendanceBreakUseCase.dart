import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../entity/break_record.dart';
import '../repository/AttendanceRepository.dart';

class EndAttendanceBreakUseCase {
  final AttendanceRepository _repository;

  const EndAttendanceBreakUseCase(this._repository);

  Future<Either<Failure, BreakRecord>> call() =>
      _repository.endAttendanceBreak();
}
