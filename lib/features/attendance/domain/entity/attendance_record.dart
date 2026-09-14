import 'attendance_durations.dart';
import 'attendance_punch.dart';

class AttendanceRecord {
  final int id;
  final String date;
  final String status;
  final bool hasActiveBreak;
  final String notes;

  final AttendancePunch checkIn;
  final AttendancePunch checkOut;

  final AttendanceDurations durations;

  final String? proofImage;

  const AttendanceRecord({
    required this.id,
    required this.date,
    required this.status,
    required this.hasActiveBreak,
    required this.notes,
    required this.checkIn,
    required this.checkOut,
    required this.durations,
    this.proofImage,
  });

  bool get hasCheckedIn => checkIn.time.isNotEmpty;
  bool get hasCheckedOut => checkOut.time.isNotEmpty;
}
