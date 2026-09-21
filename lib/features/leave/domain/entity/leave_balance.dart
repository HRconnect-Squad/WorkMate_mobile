import 'package:equatable/equatable.dart';

import 'leave_type.dart';

class LeaveBalanceItem extends Equatable {
  final LeaveType leaveType;
  final int totalDays;
  final int usedDays;
  final int remainingDays;

  const LeaveBalanceItem({
    required this.leaveType,
    required this.totalDays,
    required this.usedDays,
    required this.remainingDays,
  });

  @override
  List<Object?> get props => [leaveType, totalDays, usedDays, remainingDays];
}

class LeaveBalanceSummary extends Equatable {
  final int year;
  final List<LeaveBalanceItem> balances;

  const LeaveBalanceSummary({required this.year, required this.balances});

  @override
  List<Object?> get props => [year, balances];
}