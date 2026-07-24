// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceDetailsDataDto _$AttendanceDetailsDataDtoFromJson(
  Map<String, dynamic> json,
) => _AttendanceDetailsDataDto(
  id: (json['id'] as num?)?.toInt(),
  date: json['date'] as String?,
  status: json['status'] as String?,
  hasActiveBreak: json['has_active_break'] as bool?,
  notes: json['notes'] as String?,
  employee: json['employee'] == null
      ? null
      : AttendanceEmployeeDto.fromJson(
          json['employee'] as Map<String, dynamic>,
        ),
  checkIn: json['check_in'] == null
      ? null
      : AttendanceCheckEventDto.fromJson(
          json['check_in'] as Map<String, dynamic>,
        ),
  checkOut: json['check_out'] == null
      ? null
      : AttendanceCheckEventDto.fromJson(
          json['check_out'] as Map<String, dynamic>,
        ),
  durations: json['durations'] == null
      ? null
      : AttendanceDurationsDto.fromJson(
          json['durations'] as Map<String, dynamic>,
        ),
  proofImage: json['proof_image'] as String?,
  breaks: (json['breaks'] as List<dynamic>?)
      ?.map((e) => AttendanceBreakItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AttendanceDetailsDataDtoToJson(
  _AttendanceDetailsDataDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'status': instance.status,
  'has_active_break': instance.hasActiveBreak,
  'notes': instance.notes,
  'employee': instance.employee,
  'check_in': instance.checkIn,
  'check_out': instance.checkOut,
  'durations': instance.durations,
  'proof_image': instance.proofImage,
  'breaks': instance.breaks,
};

_AttendanceEmployeeDto _$AttendanceEmployeeDtoFromJson(
  Map<String, dynamic> json,
) => _AttendanceEmployeeDto(
  id: (json['id'] as num?)?.toInt(),
  employeeCode: json['employee_code'] as String?,
  name: json['name'] as String?,
  department: json['department'] as String?,
);

Map<String, dynamic> _$AttendanceEmployeeDtoToJson(
  _AttendanceEmployeeDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'employee_code': instance.employeeCode,
  'name': instance.name,
  'department': instance.department,
};

_AttendanceCheckEventDto _$AttendanceCheckEventDtoFromJson(
  Map<String, dynamic> json,
) => _AttendanceCheckEventDto(
  time: json['time'] as String?,
  location: json['location'] as String?,
  ip: json['ip'] as String?,
);

Map<String, dynamic> _$AttendanceCheckEventDtoToJson(
  _AttendanceCheckEventDto instance,
) => <String, dynamic>{
  'time': instance.time,
  'location': instance.location,
  'ip': instance.ip,
};

_AttendanceDurationsDto _$AttendanceDurationsDtoFromJson(
  Map<String, dynamic> json,
) => _AttendanceDurationsDto(
  worked: json['worked'] == null
      ? null
      : DurationItemDto.fromJson(json['worked'] as Map<String, dynamic>),
  overtime: json['overtime'] == null
      ? null
      : DurationItemDto.fromJson(json['overtime'] as Map<String, dynamic>),
  breaks: json['breaks'] == null
      ? null
      : DurationItemDto.fromJson(json['breaks'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AttendanceDurationsDtoToJson(
  _AttendanceDurationsDto instance,
) => <String, dynamic>{
  'worked': instance.worked,
  'overtime': instance.overtime,
  'breaks': instance.breaks,
};

_DurationItemDto _$DurationItemDtoFromJson(Map<String, dynamic> json) =>
    _DurationItemDto(
      totalSeconds: (json['total_seconds'] as num?)?.toInt(),
      formatted: json['formatted'] as String?,
    );

Map<String, dynamic> _$DurationItemDtoToJson(_DurationItemDto instance) =>
    <String, dynamic>{
      'total_seconds': instance.totalSeconds,
      'formatted': instance.formatted,
    };

_AttendanceBreakItemDto _$AttendanceBreakItemDtoFromJson(
  Map<String, dynamic> json,
) => _AttendanceBreakItemDto(
  id: (json['id'] as num?)?.toInt(),
  attendanceId: (json['attendance_id'] as num?)?.toInt(),
  time: json['time'] == null
      ? null
      : AttendanceBreakTimeDto.fromJson(json['time'] as Map<String, dynamic>),
  reason: json['reason'] as String?,
  duration: json['duration'] == null
      ? null
      : DurationItemDto.fromJson(json['duration'] as Map<String, dynamic>),
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$AttendanceBreakItemDtoToJson(
  _AttendanceBreakItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'attendance_id': instance.attendanceId,
  'time': instance.time,
  'reason': instance.reason,
  'duration': instance.duration,
  'is_active': instance.isActive,
};

_AttendanceBreakTimeDto _$AttendanceBreakTimeDtoFromJson(
  Map<String, dynamic> json,
) => _AttendanceBreakTimeDto(
  start: json['start'] as String?,
  end: json['end'] as String?,
);

Map<String, dynamic> _$AttendanceBreakTimeDtoToJson(
  _AttendanceBreakTimeDto instance,
) => <String, dynamic>{'start': instance.start, 'end': instance.end};
