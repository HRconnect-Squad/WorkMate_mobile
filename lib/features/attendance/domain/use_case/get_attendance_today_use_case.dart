import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../enitity/attendance_record.dart';
import '../repository/AttendanceRepository.dart';

class GetTodayAttendanceUseCase {
  final AttendanceRepository _repository;

  const GetTodayAttendanceUseCase(this._repository);


  Future<Either<Failure, AttendanceRecord>> call() =>
      _repository.getTodayAttendance();
}
