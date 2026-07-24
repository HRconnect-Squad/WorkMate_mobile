import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../enitity/attendance_details_entity.dart';
import '../repository/AttendanceRepository.dart';

class GetAttendanceDetailsByIdUseCase {
  final AttendanceRepository _repository;

  const GetAttendanceDetailsByIdUseCase(this._repository);

  Future<Either<Failure, AttendanceDetailsEntity>> call(String id) {
    return _repository.getAttendanceDetailsById(id);
  }
}
