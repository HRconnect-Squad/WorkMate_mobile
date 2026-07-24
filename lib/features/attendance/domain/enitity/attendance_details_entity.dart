import 'attendance_punch.dart';
import 'attendance_durations.dart';
import 'duration_value.dart';

class AttendanceDetailsEntity {
  final int id;
  final String date;
  final String status;
  final bool hasActiveBreak;
  final String? notes;
  final AttendanceEmployee employee;
  final AttendancePunch checkIn;
  final AttendancePunch? checkOut;
  final AttendanceDurations durations;
  final String? proofImage;
  final List<AttendanceBreakItem> breaks;

  const AttendanceDetailsEntity({
    required this.id,
    required this.date,
    required this.status,
    required this.hasActiveBreak,
    this.notes,
    required this.employee,
    required this.checkIn,
    this.checkOut,
    required this.durations,
    this.proofImage,
    required this.breaks,
  });
}

class AttendanceEmployee {
  final int id;
  final String employeeCode;
  final String name;
  final String? department;

  const AttendanceEmployee({
    required this.id,
    required this.employeeCode,
    required this.name,
    this.department,
  });
}

class AttendanceBreakItem {
  final int id;
  final int attendanceId;
  final String start;
  final String? end;
  final String? reason;
  final DurationValue duration;
  final bool isActive;

  const AttendanceBreakItem({
    required this.id,
    required this.attendanceId,
    required this.start,
    this.end,
    this.reason,
    required this.duration,
    required this.isActive,
  });
}