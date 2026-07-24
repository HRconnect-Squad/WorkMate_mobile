import 'duration_value.dart';

class BreakRecord {
  final int id;
  final int attendanceId;
  final String startTime;
  final String? endTime;
  final String reason;
  final DurationValue? duration;
  final bool isActive;

  const BreakRecord({
    required this.id,
    required this.attendanceId,
    required this.startTime,
    this.endTime,
    required this.reason,
    this.duration,
    required this.isActive,
  });
}
