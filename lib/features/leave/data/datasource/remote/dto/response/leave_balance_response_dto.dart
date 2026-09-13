import '../leave_type_dto.dart';

class LeaveBalanceItemDto {
  final LeaveTypeDto? leaveType;
  final int? totalDays;
  final int? usedDays;
  final int? remainingDays;

  const LeaveBalanceItemDto({this.leaveType, this.totalDays, this.usedDays, this.remainingDays});

  factory LeaveBalanceItemDto.fromJson(Map<String, dynamic> json) {
    return LeaveBalanceItemDto(
      leaveType: json['leave_type'] != null
          ? LeaveTypeDto.fromJson(json['leave_type'] as Map<String, dynamic>)
          : null,
      totalDays: json['total_days'] as int?,
      usedDays: json['used_days'] as int?,
      remainingDays: json['remaining_days'] as int?,
    );
  }
}

class LeaveBalanceResponseDto {
  final int? year;
  final List<LeaveBalanceItemDto>? balance;

  const LeaveBalanceResponseDto({this.year, this.balance});

  factory LeaveBalanceResponseDto.fromJson(Map<String, dynamic> json) {
    return LeaveBalanceResponseDto(
      year: json['year'] as int?,
      balance: (json['balance'] as List<dynamic>?)
          ?.map((e) => LeaveBalanceItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}