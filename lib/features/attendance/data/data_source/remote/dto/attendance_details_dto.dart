import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_details_dto.freezed.dart';
part 'attendance_details_dto.g.dart';

@freezed
abstract class AttendanceDetailsDataDto with _$AttendanceDetailsDataDto {
  const factory AttendanceDetailsDataDto({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "date") String? date,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "has_active_break") bool? hasActiveBreak,
    @JsonKey(name: "notes") String? notes,
    @JsonKey(name: "employee") AttendanceEmployeeDto? employee,
    @JsonKey(name: "check_in") AttendanceCheckEventDto? checkIn,
    @JsonKey(name: "check_out") AttendanceCheckEventDto? checkOut,
    @JsonKey(name: "durations") AttendanceDurationsDto? durations,
    @JsonKey(name: "proof_image") String? proofImage,
    @JsonKey(name: "breaks") List<AttendanceBreakItemDto>? breaks,
  }) = _AttendanceDetailsDataDto;

  factory AttendanceDetailsDataDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDetailsDataDtoFromJson(json);
}

@freezed
abstract class AttendanceEmployeeDto with _$AttendanceEmployeeDto {
  const factory AttendanceEmployeeDto({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "employee_code") String? employeeCode,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "department") String? department,
  }) = _AttendanceEmployeeDto;

  factory AttendanceEmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceEmployeeDtoFromJson(json);
}

@freezed
abstract class AttendanceCheckEventDto with _$AttendanceCheckEventDto {
  const factory AttendanceCheckEventDto({
    @JsonKey(name: "time") String? time,
    @JsonKey(name: "location") String? location,
    @JsonKey(name: "ip") String? ip,
  }) = _AttendanceCheckEventDto;

  factory AttendanceCheckEventDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceCheckEventDtoFromJson(json);
}

@freezed
abstract class AttendanceDurationsDto with _$AttendanceDurationsDto {
  const factory AttendanceDurationsDto({
    @JsonKey(name: "worked") DurationItemDto? worked,
    @JsonKey(name: "overtime") DurationItemDto? overtime,
    @JsonKey(name: "breaks") DurationItemDto? breaks,
  }) = _AttendanceDurationsDto;

  factory AttendanceDurationsDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDurationsDtoFromJson(json);
}

@freezed
abstract class DurationItemDto with _$DurationItemDto {
  const factory DurationItemDto({
    @JsonKey(name: "total_seconds") int? totalSeconds,
    @JsonKey(name: "formatted") String? formatted,
  }) = _DurationItemDto;

  factory DurationItemDto.fromJson(Map<String, dynamic> json) =>
      _$DurationItemDtoFromJson(json);
}

@freezed
abstract class AttendanceBreakItemDto with _$AttendanceBreakItemDto {
  const factory AttendanceBreakItemDto({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "attendance_id") int? attendanceId,
    @JsonKey(name: "time") AttendanceBreakTimeDto? time,
    @JsonKey(name: "reason") String? reason,
    @JsonKey(name: "duration") DurationItemDto? duration,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _AttendanceBreakItemDto;

  factory AttendanceBreakItemDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceBreakItemDtoFromJson(json);
}

@freezed
abstract class AttendanceBreakTimeDto with _$AttendanceBreakTimeDto {
  const factory AttendanceBreakTimeDto({
    @JsonKey(name: "start") String? start,
    @JsonKey(name: "end") String? end,
  }) = _AttendanceBreakTimeDto;

  factory AttendanceBreakTimeDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceBreakTimeDtoFromJson(json);
}