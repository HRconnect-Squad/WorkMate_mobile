import 'package:freezed_annotation/freezed_annotation.dart';

import 'attendance_record_response.dart';

part 'history_attendance_response.freezed.dart';
part 'history_attendance_response.g.dart';

@freezed
abstract class HistoryAttendanceResponse with _$HistoryAttendanceResponse {
  const factory HistoryAttendanceResponse({
    @JsonKey(name: "start_date") String? startDate,
    @JsonKey(name: "end_date") String? endDate,
    @JsonKey(name: "month") int? month,
    @JsonKey(name: "year") int? year,
    @JsonKey(name: "summary") HistorySummaryResponse? summary,
    @JsonKey(name: "records") List<AttendanceRecordResponse>? records,
  }) = _HistoryAttendanceResponse;

  factory HistoryAttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryAttendanceResponseFromJson(json);
}

@freezed
abstract class HistorySummaryResponse with _$HistorySummaryResponse {
  const factory HistorySummaryResponse({
    @JsonKey(name: "total_days") int? totalDays,
    @JsonKey(name: "present_days") int? presentDays,
    @JsonKey(name: "late_days") int? lateDays,
    @JsonKey(name: "absent_days") int? absentDays,
    @JsonKey(name: "durations") AttendanceDurationsResponse? durations,
  }) = _HistorySummaryResponse;

  factory HistorySummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistorySummaryResponseFromJson(json);
}
