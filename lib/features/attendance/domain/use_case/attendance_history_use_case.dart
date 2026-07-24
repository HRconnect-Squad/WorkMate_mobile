import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../enitity/history_attendance.dart';
import '../repository/AttendanceRepository.dart';

class GetAttendanceHistoryUseCase {
  final AttendanceRepository _repository;
  GetAttendanceHistoryUseCase(this._repository);
  Future<Either<Failure, HistoryAttendance>> call() =>
      _repository.attendanceHistory();
}
