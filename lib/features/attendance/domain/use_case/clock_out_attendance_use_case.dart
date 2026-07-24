import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../enitity/attendance_record.dart';
import '../repository/AttendanceRepository.dart';

class ClockOutAttendanceUseCase {
  final AttendanceRepository _repository;

  const ClockOutAttendanceUseCase(this._repository);

  Future<Either<Failure, AttendanceRecord>> call() =>
      _repository.attendanceClockOut();
}
