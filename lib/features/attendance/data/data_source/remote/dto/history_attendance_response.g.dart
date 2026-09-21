// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryAttendanceResponse _$HistoryAttendanceResponseFromJson(
  Map<String, dynamic> json,
) => _HistoryAttendanceResponse(
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  month: (json['month'] as num?)?.toInt(),
  year: (json['year'] as num?)?.toInt(),
  summary: json['summary'] == null
      ? null
      : HistorySummaryResponse.fromJson(
          json['summary'] as Map<String, dynamic>,
        ),
  records: (json['records'] as List<dynamic>?)
      ?.map((e) => AttendanceRecordResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HistoryAttendanceResponseToJson(
  _HistoryAttendanceResponse instance,
) => <String, dynamic>{
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'month': instance.month,
  'year': instance.year,
  'summary': instance.summary,
  'records': instance.records,
};

_HistorySummaryResponse _$HistorySummaryResponseFromJson(
  Map<String, dynamic> json,
) => _HistorySummaryResponse(
  totalDays: (json['total_days'] as num?)?.toInt(),
  presentDays: (json['present_days'] as num?)?.toInt(),
  lateDays: (json['late_days'] as num?)?.toInt(),
  absentDays: (json['absent_days'] as num?)?.toInt(),
  durations: json['durations'] == null
      ? null
      : AttendanceDurationsResponse.fromJson(
          json['durations'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HistorySummaryResponseToJson(
  _HistorySummaryResponse instance,
) => <String, dynamic>{
  'total_days': instance.totalDays,
  'present_days': instance.presentDays,
  'late_days': instance.lateDays,
  'absent_days': instance.absentDays,
  'durations': instance.durations,
};
