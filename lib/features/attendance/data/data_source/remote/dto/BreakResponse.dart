class BreakResponse {
  final int id;
  final int attendanceId;
  final DateTime breakStart;
  final DateTime? breakEnd;
  final int? durationMinutes;
  final String? reason;

  BreakResponse({
    required this.id,
    required this.attendanceId,
    required this.breakStart,
    this.breakEnd,
    this.durationMinutes,
    this.reason,
  });

  factory BreakResponse.fromJson(Map<String, dynamic> json) {
    return BreakResponse(
      id: json['id'],
      attendanceId: json['attendance_id'],
      breakStart: DateTime.parse(json['break_start']),
      breakEnd:
      json['break_end'] != null ? DateTime.parse(json['break_end']) : null,
      durationMinutes: json['duration_minutes'],
      reason: json['reason'],
    );
  }
}
