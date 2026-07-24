import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../enitity/attendance_details_entity.dart';
import '../enitity/attendance_record.dart';
import '../enitity/attendanceclockIn.dart';
import '../enitity/break_record.dart';
import '../enitity/history_attendance.dart';

abstract class AttendanceRepository {
  Future<Either<Failure, HistoryAttendance>> attendanceHistory();

  Future<Either<Failure, AttendanceRecord>> getTodayAttendance();

  Future<Either<Failure, AttendanceRecord>> clockInAttendance({
    required ClockInAttendance clockInAttendance,
  });

  Future<Either<Failure, AttendanceRecord>> attendanceClockOut();

  Future<Either<Failure, BreakRecord>> startAttendanceBreak();

  Future<Either<Failure, BreakRecord>> endAttendanceBreak();

  Future<Either<Failure, AttendanceDetailsEntity>> getAttendanceDetailsById(
    String id,
  );
}
