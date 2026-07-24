import '../../domain/enitity/attendance_durations.dart';
import '../../domain/enitity/attendance_punch.dart';
import '../../domain/enitity/attendance_record.dart';
import '../../domain/enitity/attendanceclockIn.dart';
import '../../domain/enitity/break_record.dart';
import '../../domain/enitity/duration_value.dart';
import '../../domain/enitity/history_attendance.dart';
import '../data_source/remote/dto/attendance_record_response.dart';
import '../data_source/remote/dto/break_response.dart';
import '../data_source/remote/dto/clock_in_attendance_request.dart';
import '../data_source/remote/dto/history_attendance_response.dart';

class AttendanceMapper {
  static DurationValue toDomainDurationValue(DurationValueResponse? response) {
    return DurationValue(
      totalSeconds: response?.totalSeconds ?? 0,
      formatted: response?.formatted ?? '00:00:00',
    );
  }

  static AttendanceDurations toDomainDurations(
    AttendanceDurationsResponse? response,
  ) {
    return AttendanceDurations(
      worked: toDomainDurationValue(response?.worked),
      overtime: toDomainDurationValue(response?.overtime),
      breaks: toDomainDurationValue(response?.breaks),
    );
  }

  static AttendancePunch toDomainPunch(AttendancePunchResponse? response) {
    return AttendancePunch(
      time: response?.time ?? '',
      location: response?.location ?? '',
      ip: response?.ip ?? '',
    );
  }

  static AttendanceRecord toDomainRecord(AttendanceRecordResponse response) {
    return AttendanceRecord(
      id: response.id ?? 0,
      date: response.date ?? '',
      status: response.status ?? '',
      hasActiveBreak: response.hasActiveBreak ?? false,
      notes: response.notes ?? '',
      checkIn: toDomainPunch(response.checkIn),
      checkOut: toDomainPunch(response.checkOut),
      durations: toDomainDurations(response.durations),
      proofImage: response.proofImage,
    );
  }

  static BreakRecord toDomainBreak(BreakResponse response) {
    return BreakRecord(
      id: response.id ?? 0,
      attendanceId: response.attendanceId ?? 0,
      startTime: response.time?.start ?? '',
      endTime: response.time?.end,
      reason: response.reason ?? '',
      duration: response.duration == null
          ? null
          : toDomainDurationValue(response.duration),
      isActive: response.isActive ?? false,
    );
  }

  static HistoryAttendance toDomainHistory(
    HistoryAttendanceResponse response,
  ) {
    return HistoryAttendance(
      startDate: response.startDate ?? '',
      endDate: response.endDate ?? '',
      month: response.month ?? 0,
      year: response.year ?? 0,
      days: (response.records ?? const <AttendanceRecordResponse>[])
          .map(toDomainRecord)
          .toList(),
      summary: toDomainSummary(
        response.summary ?? const HistorySummaryResponse(),
      ),
    );
  }

  static Summary toDomainSummary(HistorySummaryResponse response) {
    return Summary(
      totalDays: response.totalDays ?? 0,
      presentDays: response.presentDays ?? 0,
      lateDays: response.lateDays ?? 0,
      absentDays: response.absentDays ?? 0,
      durations: toDomainDurations(response.durations),
    );
  }

  static ClockInAttendanceRequest toDtoClockInRequest(
    ClockInAttendance attendanceClockIn,
  ) {
    return ClockInAttendanceRequest(
      latitude: attendanceClockIn.latitude,
      longitude: attendanceClockIn.longitude,
      notes: attendanceClockIn.notes ?? '',
      proofImage: attendanceClockIn.proofImage,
    );
  }
}
