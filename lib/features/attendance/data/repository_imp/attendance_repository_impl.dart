import 'package:fpdart/fpdart.dart';

import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/UserInfo.dart';
import '../../domain/entity/attendance_details_entity.dart';
import '../../domain/entity/attendance_durations.dart';
import '../../domain/entity/attendance_punch.dart';
import '../../domain/entity/attendance_record.dart';
import '../../domain/entity/attendanceclockIn.dart';
import '../../domain/entity/break_record.dart';
import '../../domain/entity/duration_value.dart';
import '../../domain/entity/history_attendance.dart';
import '../../domain/repository/AttendanceRepository.dart';
import '../data_source/local/attendance_local_data_source.dart';
import '../data_source/remote/attendance_remote_data_source.dart';
import '../mappers/attendance_details_mapper.dart';
import '../mappers/attendance_mapper.dart';

class AttendanceRepositoryImpl with SafeApiCall implements AttendanceRepository {
  final AttendanceRemoteDataSource _attendanceRemoteDataSource;
  final AttendanceLocalDataSource _attendanceLocalDataSource;

  const AttendanceRepositoryImpl({
    required AttendanceRemoteDataSource attendanceRemoteDataSource,
    required AttendanceLocalDataSource attendanceLocalDataSource,
  })  : _attendanceRemoteDataSource = attendanceRemoteDataSource,
        _attendanceLocalDataSource = attendanceLocalDataSource;

  @override
  Future<Either<Failure, HistoryAttendance>> attendanceHistory() async {
    return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.attendanceHistory();
      return response.toEntity();
    });
  }

  @override
  Future<Either<Failure, AttendanceRecord>> getTodayAttendance() async {
    return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.attendanceToday();
      if (response == null) {
        return AttendanceRecord(
          id: 0,
          date: '',
          status: '',
          hasActiveBreak: false,
          notes: '',
          checkIn: const AttendancePunch(time: '', location: '', ip: ''),
          checkOut: const AttendancePunch(time: '', location: '', ip: ''),
          durations: AttendanceDurations(
            worked: const DurationValue(totalSeconds: 0, formatted: '00:00:00'),
            overtime: const DurationValue(totalSeconds: 0, formatted: '00:00:00'),
            breaks: const DurationValue(totalSeconds: 0, formatted: '00:00:00'),
          ),
          proofImage: null,
        );
      }
      return response.toEntity();
    });
  }

  @override
  Future<Either<Failure, AttendanceRecord>> clockInAttendance({
    required ClockInAttendance clockInAttendance,
  }) async {
    return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.clockInAttendance(
        clockInAttendance.toDto(),
      );
      return response.toEntity();
    });
  }

  @override
  Future<Either<Failure, AttendanceRecord>> attendanceClockOut() async {
    return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.attendanceClockOut();
      return response.toEntity();
    });
  }

  @override
  Future<Either<Failure, BreakRecord>> startAttendanceBreak() async {
    return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.startAttendanceBreak();
      return response.toEntity();
    });
  }

  @override
  Future<Either<Failure, BreakRecord>> endAttendanceBreak() async {
    return safeApiCall(call: () async {
      final response = await _attendanceRemoteDataSource.endAttendanceBreak();
      return response.toEntity();
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
    return safeApiCall(call: () async {
      final cachedUser = await _attendanceLocalDataSource.getCachedUserInfo();
      if (cachedUser == null) {
        throw Exception('NO_CACHED_USER_INFO');
      }
      return cachedUser;
    });
  }
}