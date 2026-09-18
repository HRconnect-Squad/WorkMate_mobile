class AttendancePunch {
  final String time;
  final String? location;
  final String ip;

  const AttendancePunch({
    required this.time,
    this.location,
    required this.ip,
  });
}