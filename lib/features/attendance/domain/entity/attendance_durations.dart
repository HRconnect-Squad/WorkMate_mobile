import 'duration_value.dart';

class AttendanceDurations {
  final DurationValue worked;
  final DurationValue overtime;
  final DurationValue breaks;

  const AttendanceDurations({
    required this.worked,
    required this.overtime,
    required this.breaks,
  });
}
