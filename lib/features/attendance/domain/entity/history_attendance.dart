import 'attendance_durations.dart';
import 'attendance_record.dart';

class HistoryAttendance {
  final String startDate;
  final String endDate;
  final int month;
  final int year;
  final List<AttendanceRecord> days;
  final Summary summary;

  const HistoryAttendance({
    required this.startDate,
    required this.endDate,
    required this.month,
    required this.year,
    required this.days,
    required this.summary,
  });
}

class Summary {
  final int totalDays;
  final int presentDays;
  final int lateDays;
  final int absentDays;
  final AttendanceDurations durations;

  const Summary({
    required this.totalDays,
    required this.presentDays,
    required this.lateDays,
    required this.absentDays,
    required this.durations,
  });
}
