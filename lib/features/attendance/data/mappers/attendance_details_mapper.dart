import '../data_source/remote/dto/attendance_details_dto.dart'; // ⚠️ عدّلي المسار لو مختلف
import '../../domain/enitity/attendance_details_entity.dart';
import '../../domain/enitity/attendance_punch.dart';
import '../../domain/enitity/attendance_durations.dart';
import '../../domain/enitity/duration_value.dart';

extension AttendanceDetailsDataDtoMapper on AttendanceDetailsDataDto {
  AttendanceDetailsEntity toEntity() {
    return AttendanceDetailsEntity(
      id: id ?? 0,
      date: date ?? '',
      status: status ?? '',
      hasActiveBreak: hasActiveBreak ?? false,
      notes: notes,
      employee: employee?.toEntity() ??
          const AttendanceEmployee(id: 0, employeeCode: '', name: ''),
      checkIn: checkIn?.toEntity() ?? const AttendancePunch(time: '', ip: ''),
      checkOut: checkOut?.toEntity(),
      durations: durations?.toEntity() ??
          AttendanceDurations(
            worked: const DurationValue(totalSeconds: 0, formatted: '00:00:00'),
            overtime: const DurationValue(totalSeconds: 0, formatted: '00:00:00'),
            breaks: const DurationValue(totalSeconds: 0, formatted: '00:00:00'),
          ),
      proofImage: proofImage,
      breaks: breaks?.map((b) => b.toEntity()).toList() ?? const [],
    );
  }
}

extension AttendanceEmployeeDtoMapper on AttendanceEmployeeDto {
  AttendanceEmployee toEntity() {
    return AttendanceEmployee(
      id: id ?? 0,
      employeeCode: employeeCode ?? '',
      name: name ?? '',
      department: department,
    );
  }
}

extension AttendanceCheckEventDtoMapper on AttendanceCheckEventDto {
  AttendancePunch toEntity() {
    return AttendancePunch(
      time: time ?? '',
      location: location,
      ip: ip ?? '',
    );
  }
}

extension AttendanceDurationsDtoMapper on AttendanceDurationsDto {
  AttendanceDurations toEntity() {
    const zero = DurationValue(totalSeconds: 0, formatted: '00:00:00');
    return AttendanceDurations(
      worked: worked?.toEntity() ?? zero,
      overtime: overtime?.toEntity() ?? zero,
      breaks: breaks?.toEntity() ?? zero,
    );
  }
}

extension DurationItemDtoMapper on DurationItemDto {
  DurationValue toEntity() {
    return DurationValue(
      totalSeconds: totalSeconds ?? 0,
      formatted: formatted ?? '00:00:00',
    );
  }
}

extension AttendanceBreakItemDtoMapper on AttendanceBreakItemDto {
  AttendanceBreakItem toEntity() {
    return AttendanceBreakItem(
      id: id ?? 0,
      attendanceId: attendanceId ?? 0,
      start: time?.start ?? '',
      end: time?.end,
      reason: reason,
      duration: duration?.toEntity() ??
          const DurationValue(totalSeconds: 0, formatted: '00:00:00'),
      isActive: isActive ?? false,
    );
  }
}