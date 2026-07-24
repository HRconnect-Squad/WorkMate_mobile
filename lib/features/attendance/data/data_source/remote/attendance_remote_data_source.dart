import 'dto/attendance_details_dto.dart';
import 'dto/attendance_record_response.dart';
import 'dto/break_response.dart';
import 'dto/clock_in_attendance_request.dart';
import 'dto/history_attendance_response.dart';

abstract class AttendanceRemoteDataSource {
  Future<HistoryAttendanceResponse> attendanceHistory();

  Future<AttendanceRecordResponse> attendanceToday();

  Future<AttendanceRecordResponse> clockInAttendance(
    ClockInAttendanceRequest clockInAttendanceRequest,
  );

  Future<AttendanceRecordResponse> attendanceClockOut();

  Future<BreakResponse> startAttendanceBreak();

  Future<BreakResponse> endAttendanceBreak();

  Future<AttendanceDetailsDataDto> attendanceDetailsById(String id);
}
