class ClockInAttendanceRequest {
  final num latitude;
  final num longitude;
  final String notes;
  final String proofImage;

  const ClockInAttendanceRequest({
    required this.latitude,
    required this.longitude,
    required this.notes,
    required this.proofImage,
  });
}
