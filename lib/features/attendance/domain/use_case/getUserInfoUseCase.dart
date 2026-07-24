import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../enitity/UserInfo.dart';
import '../repository/AttendanceRepository.dart';

class GetUserInfoUseCase {
  final AttendanceRepository _attendanceRepository;

  const GetUserInfoUseCase(this._attendanceRepository);

  Future<Either<Failure, UserInfo>> call() async {
    return _attendanceRepository.getUserInfo();
  }
}