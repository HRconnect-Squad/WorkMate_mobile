// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'break_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BreakResponse _$BreakResponseFromJson(Map<String, dynamic> json) =>
    _BreakResponse(
      id: (json['id'] as num?)?.toInt(),
      attendanceId: (json['attendance_id'] as num?)?.toInt(),
      time: json['time'] == null
          ? null
          : BreakTimeResponse.fromJson(json['time'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
      duration: json['duration'] == null
          ? null
          : DurationValueResponse.fromJson(
              json['duration'] as Map<String, dynamic>,
            ),
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$BreakResponseToJson(_BreakResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attendance_id': instance.attendanceId,
      'time': instance.time,
      'reason': instance.reason,
      'duration': instance.duration,
      'is_active': instance.isActive,
    };

_BreakTimeResponse _$BreakTimeResponseFromJson(Map<String, dynamic> json) =>
    _BreakTimeResponse(
      start: json['start'] as String?,
      end: json['end'] as String?,
    );

Map<String, dynamic> _$BreakTimeResponseToJson(_BreakTimeResponse instance) =>
    <String, dynamic>{'start': instance.start, 'end': instance.end};
