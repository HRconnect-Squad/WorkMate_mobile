import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../enitity/attendance_record.dart';
import '../enitity/attendanceclockIn.dart';
import '../repository/AttendanceRepository.dart';

class ClockInAttendanceUseCase {
  final AttendanceRepository _repository;

  const ClockInAttendanceUseCase(this._repository);

  Future<Either<Failure, AttendanceRecord>> call({
    required ClockInAttendance attendanceClockIn,
  }) =>
      _repository.clockInAttendance(clockInAttendance: attendanceClockIn);
}
