import '../../domain/entity/attendance_durations.dart';
import '../../domain/entity/attendance_punch.dart';
import '../../domain/entity/attendance_record.dart';
import '../../domain/entity/attendanceclockIn.dart';
import '../../domain/entity/break_record.dart';
import '../../domain/entity/duration_value.dart';
import '../../domain/entity/history_attendance.dart';
import '../data_source/remote/dto/attendance_record_response.dart';
import '../data_source/remote/dto/break_response.dart';
import '../data_source/remote/dto/clock_in_attendance_request.dart';
import '../data_source/remote/dto/history_attendance_response.dart';

const _zeroDuration = DurationValue(totalSeconds: 0, formatted: '00:00:00');

extension DurationValueResponseMapper on DurationValueResponse {
  DurationValue toEntity() {
    return DurationValue(
      totalSeconds: totalSeconds ?? 0,
      formatted: formatted ?? '00:00:00',
    );
  }
}

extension AttendanceDurationsResponseMapper on AttendanceDurationsResponse {
  AttendanceDurations toEntity() {
    return AttendanceDurations(
      worked: worked?.toEntity() ?? _zeroDuration,
      overtime: overtime?.toEntity() ?? _zeroDuration,
      breaks: breaks?.toEntity() ?? _zeroDuration,
    );
  }
}

extension AttendancePunchResponseMapper on AttendancePunchResponse {
  AttendancePunch toEntity() {
    return AttendancePunch(
      time: time ?? '',
      location: location ?? '',
      ip: ip ?? '',
    );
  }
}

const _emptyPunch = AttendancePunch(time: '', location: '', ip: '');
const _emptyDurations = AttendanceDurations(
  worked: _zeroDuration,
  overtime: _zeroDuration,
  breaks: _zeroDuration,
);

extension AttendanceRecordResponseMapper on AttendanceRecordResponse {
  AttendanceRecord toEntity() {
    return AttendanceRecord(
      id: id ?? 0,
      date: date ?? '',
      status: status ?? '',
      hasActiveBreak: hasActiveBreak ?? false,
      notes: notes ?? '',
      checkIn: checkIn?.toEntity() ?? _emptyPunch,
      checkOut: checkOut?.toEntity() ?? _emptyPunch,
      durations: durations?.toEntity() ?? _emptyDurations,
      proofImage: proofImage,
    );
  }
}

extension BreakResponseMapper on BreakResponse {
  BreakRecord toEntity() {
    return BreakRecord(
      id: id ?? 0,
      attendanceId: attendanceId ?? 0,
      startTime: time?.start ?? '',
      endTime: time?.end,
      reason: reason ?? '',
      duration: duration?.toEntity(),
      isActive: isActive ?? false,
    );
  }
}

extension HistoryAttendanceResponseMapper on HistoryAttendanceResponse {
  HistoryAttendance toEntity() {
    return HistoryAttendance(
      startDate: startDate ?? '',
      endDate: endDate ?? '',
      month: month ?? 0,
      year: year ?? 0,
      days: (records ?? const <AttendanceRecordResponse>[])
          .map((record) => record.toEntity())
          .toList(),
      summary: (summary ?? const HistorySummaryResponse()).toEntity(),
    );
  }
}

extension HistorySummaryResponseMapper on HistorySummaryResponse {
  Summary toEntity() {
    return Summary(
      totalDays: totalDays ?? 0,
      presentDays: presentDays ?? 0,
      lateDays: lateDays ?? 0,
      absentDays: absentDays ?? 0,
      durations: durations?.toEntity() ?? _emptyDurations,
    );
  }
}

extension ClockInAttendanceDtoMapper on ClockInAttendance {
  ClockInAttendanceRequest toDto() {
    return ClockInAttendanceRequest(
      latitude: latitude,
      longitude: longitude,
      notes: notes ?? '',
      proofImage: proofImage,
    );
  }
}