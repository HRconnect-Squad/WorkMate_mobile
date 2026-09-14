import 'package:equatable/equatable.dart';

import '../../../domain/entity/leave.dart';
import '../../../domain/entity/leave_balance.dart';
import '../../../domain/entity/leave_status.dart';


class LeaveSummaryState extends Equatable {
  final LeaveBalanceSummary? balance;
  final LeaveStatus selectedStatus;
  final Map<LeaveStatus, List<Leave>> requestsByStatus;
  final bool isLoadingBalance;
  final bool isLoadingRequests;
  final String? error;

  const LeaveSummaryState({
    this.balance,
    this.selectedStatus = LeaveStatus.pending,
    this.requestsByStatus = const {},
    this.isLoadingBalance = false,
    this.isLoadingRequests = false,
    this.error,
  });

  List<Leave> get currentRequests => requestsByStatus[selectedStatus] ?? const [];
  bool get hasLoadedCurrentTab => requestsByStatus.containsKey(selectedStatus);

  int get availableDays =>
      balance?.balances.fold<int>(0, (sum, b) => sum + b.remainingDays) ?? 0;
  int get usedDays =>
      balance?.balances.fold<int>(0, (sum, b) => sum + b.usedDays) ?? 0;

  LeaveSummaryState copyWith({
    LeaveBalanceSummary? balance,
    LeaveStatus? selectedStatus,
    Map<LeaveStatus, List<Leave>>? requestsByStatus,
    bool? isLoadingBalance,
    bool? isLoadingRequests,
    String? error,
    bool clearError = false,
  }) {
    return LeaveSummaryState(
      balance: balance ?? this.balance,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      requestsByStatus: requestsByStatus ?? this.requestsByStatus,
      isLoadingBalance: isLoadingBalance ?? this.isLoadingBalance,
      isLoadingRequests: isLoadingRequests ?? this.isLoadingRequests,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props =>
      [balance, selectedStatus, requestsByStatus, isLoadingBalance, isLoadingRequests, error];
}