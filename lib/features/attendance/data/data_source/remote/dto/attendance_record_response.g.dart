// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_record_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceRecordResponse _$AttendanceRecordResponseFromJson(
  Map<String, dynamic> json,
) => _AttendanceRecordResponse(
  id: (json['id'] as num?)?.toInt(),
  date: json['date'] as String?,
  status: json['status'] as String?,
  hasActiveBreak: json['has_active_break'] as bool?,
  notes: json['notes'] as String?,
  checkIn: json['check_in'] == null
      ? null
      : AttendancePunchResponse.fromJson(
          json['check_in'] as Map<String, dynamic>,
        ),
  checkOut: json['check_out'] == null
      ? null
      : AttendancePunchResponse.fromJson(
          json['check_out'] as Map<String, dynamic>,
        ),
  durations: json['durations'] == null
      ? null
      : AttendanceDurationsResponse.fromJson(
          json['durations'] as Map<String, dynamic>,
        ),
  proofImage: json['proof_image'] as String?,
);

Map<String, dynamic> _$AttendanceRecordResponseToJson(
  _AttendanceRecordResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'status': instance.status,
  'has_active_break': instance.hasActiveBreak,
  'notes': instance.notes,
  'check_in': instance.checkIn,
  'check_out': instance.checkOut,
  'durations': instance.durations,
  'proof_image': instance.proofImage,
};

_AttendancePunchResponse _$AttendancePunchResponseFromJson(
  Map<String, dynamic> json,
) => _AttendancePunchResponse(
  time: json['time'] as String?,
  location: json['location'] as String?,
  ip: json['ip'] as String?,
);

Map<String, dynamic> _$AttendancePunchResponseToJson(
  _AttendancePunchResponse instance,
) => <String, dynamic>{
  'time': instance.time,
  'location': instance.location,
  'ip': instance.ip,
};

_AttendanceDurationsResponse _$AttendanceDurationsResponseFromJson(
  Map<String, dynamic> json,
) => _AttendanceDurationsResponse(
  worked: json['worked'] == null
      ? null
      : DurationValueResponse.fromJson(json['worked'] as Map<String, dynamic>),
  overtime: json['overtime'] == null
      ? null
      : DurationValueResponse.fromJson(
          json['overtime'] as Map<String, dynamic>,
        ),
  breaks: json['breaks'] == null
      ? null
      : DurationValueResponse.fromJson(json['breaks'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AttendanceDurationsResponseToJson(
  _AttendanceDurationsResponse instance,
) => <String, dynamic>{
  'worked': instance.worked,
  'overtime': instance.overtime,
  'breaks': instance.breaks,
};

_DurationValueResponse _$DurationValueResponseFromJson(
  Map<String, dynamic> json,
) => _DurationValueResponse(
  totalSeconds: (json['total_seconds'] as num?)?.toInt(),
  formatted: json['formatted'] as String?,
);

Map<String, dynamic> _$DurationValueResponseToJson(
  _DurationValueResponse instance,
) => <String, dynamic>{
  'total_seconds': instance.totalSeconds,
  'formatted': instance.formatted,
};
