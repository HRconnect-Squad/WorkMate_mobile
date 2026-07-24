import 'package:fpdart/fpdart.dart';

import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/enitity/UserInfo.dart';
import '../../domain/enitity/attendance_details_entity.dart';
import '../../domain/enitity/attendance_record.dart';
import '../../domain/enitity/attendanceclockIn.dart';
import '../../domain/enitity/break_record.dart';
import '../../domain/enitity/history_attendance.dart';
import '../../domain/repository/AttendanceRepository.dart';
import '../data_source/local/ttendance_local_data_source.dart';
import '../data_source/remote/attendance_remote_data_source.dart';
import '../mappers/attendance_details_mapper.dart';
import '../mappers/attendance_mapper.dart';

class AttendanceRepositoryImpl with SafeApiCall implements AttendanceRepository {
  final AttendanceRemoteDataSource _attendanceRemoteDataSource;
  final AttendanceLocalDataSource _attendanceLocalDataSource;

  const AttendanceRepositoryImpl({
    required AttendanceRemoteDataSource attendanceRemoteDataSource,
    required AttendanceLocalDataSource attendanceLocalDataSource,
  }) : _attendanceRemoteDataSource = attendanceRemoteDataSource
    , _attendanceLocalDataSource = attendanceLocalDataSource;

  @override
  Future<Either<Failure, HistoryAttendance>> attendanceHistory() async {
   return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.attendanceHistory();
      return AttendanceMapper.toDomainHistory(response);
    });
  }

  @override
  Future<Either<Failure, AttendanceRecord>> getTodayAttendance() async {
    return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.attendanceToday();
      return AttendanceMapper.toDomainRecord(response);
    });
  }

  @override
  Future<Either<Failure, AttendanceRecord>> clockInAttendance({
    required ClockInAttendance clockInAttendance,
  }) async {
    return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.clockInAttendance(
        AttendanceMapper.toDtoClockInRequest(clockInAttendance),
      );
      return AttendanceMapper.toDomainRecord(response);
    });
  }

  @override
  Future<Either<Failure, AttendanceRecord>> attendanceClockOut() async {
   return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.attendanceClockOut();
      return AttendanceMapper.toDomainRecord(response);
    });
   }

  @override
  Future<Either<Failure, BreakRecord>> startAttendanceBreak() async {
   return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.startAttendanceBreak();
      return AttendanceMapper.toDomainBreak(response);
    });
  }

  @override
  Future<Either<Failure, BreakRecord>> endAttendanceBreak() async {
    return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.endAttendanceBreak();
      return AttendanceMapper.toDomainBreak(response);
    });
  }
  @override
  Future<Either<Failure, AttendanceDetailsEntity>> getAttendanceDetailsById(
      String id,
      ) async {
    return safeApiCall(call: () async {
      final response =
      await _attendanceRemoteDataSource.attendanceDetailsById(id);
      return response.toEntity();
    });
  }
  @override
  Future<Either<Failure, UserInfo>> getUserInfo() async {
    try {
      final cachedUser = await _attendanceLocalDataSource.getCachedUserInfo();

      if (cachedUser == null) {
        return Left(UnknownFailure());
      }

      return Right(cachedUser);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
