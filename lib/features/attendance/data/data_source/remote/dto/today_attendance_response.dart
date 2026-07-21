import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_attendance_response.freezed.dart';
part 'today_attendance_response.g.dart';

@freezed
abstract class TodayAttendanceResponse with _$TodayAttendanceResponse {
  const factory TodayAttendanceResponse({
    @JsonKey(name: "id")
    int? id,

    @JsonKey(name: "date")
    String? date,

    @JsonKey(name: "status")
    String? status,

    @JsonKey(name: "has_active_break")
    bool? hasActiveBreak,

    @JsonKey(name: "notes")
    String? notes,

    @JsonKey(name: "check_in")
    AttendancePunchResponse? checkIn,

    @JsonKey(name: "check_out")
    AttendancePunchResponse? checkOut,

    @JsonKey(name: "durations")
    AttendanceDurationsResponse? durations,
  }) = _TodayAttendanceResponse;

  factory TodayAttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$TodayAttendanceResponseFromJson(json);
}

@freezed
abstract class AttendancePunchResponse with _$AttendancePunchResponse {
  const factory AttendancePunchResponse({
    @JsonKey(name: "time")
    String? time,

    @JsonKey(name: "location")
    String? location,

    @JsonKey(name: "ip")
    String? ip,
  }) = _AttendancePunchResponse;

  factory AttendancePunchResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendancePunchResponseFromJson(json);
}

@freezed
abstract class AttendanceDurationsResponse with _$AttendanceDurationsResponse {
  const factory AttendanceDurationsResponse({
    @JsonKey(name: "worked")
    DurationValueResponse? worked,

    @JsonKey(name: "overtime")
    DurationValueResponse? overtime,

    @JsonKey(name: "breaks")
    DurationValueResponse? breaks,
  }) = _AttendanceDurationsResponse;

  factory AttendanceDurationsResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDurationsResponseFromJson(json);
}

@freezed
abstract class DurationValueResponse with _$DurationValueResponse {
  const factory DurationValueResponse({
    @JsonKey(name: "total_seconds")
    int? totalSeconds,

    @JsonKey(name: "formatted")
    String? formatted,
  }) = _DurationValueResponse;

  factory DurationValueResponse.fromJson(Map<String, dynamic> json) =>
      _$DurationValueResponseFromJson(json);
}