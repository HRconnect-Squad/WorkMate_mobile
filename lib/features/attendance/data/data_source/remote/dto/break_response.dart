import 'package:freezed_annotation/freezed_annotation.dart';

import 'attendance_record_response.dart';

part 'break_response.freezed.dart';
part 'break_response.g.dart';

@freezed
abstract class BreakResponse with _$BreakResponse {
  const factory BreakResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "attendance_id") int? attendanceId,
    @JsonKey(name: "time") BreakTimeResponse? time,
    @JsonKey(name: "reason") String? reason,
    @JsonKey(name: "duration") DurationValueResponse? duration,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _BreakResponse;

  factory BreakResponse.fromJson(Map<String, dynamic> json) =>
      _$BreakResponseFromJson(json);
}

@freezed
abstract class BreakTimeResponse with _$BreakTimeResponse {
  const factory BreakTimeResponse({
    @JsonKey(name: "start") String? start,
    @JsonKey(name: "end") String? end,
  }) = _BreakTimeResponse;

  factory BreakTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$BreakTimeResponseFromJson(json);
}
