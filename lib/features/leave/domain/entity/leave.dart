import 'package:equatable/equatable.dart';

import 'leave_status.dart';
import 'leave_type.dart';

class Leave extends Equatable {
  final int id;
  final LeaveType leaveType;
  final DateTime startDate;
  final DateTime endDate;
  final int totalDays;
  final LeaveStatus status;
  final String reason;
  final String? attachmentPath;
  final String? rejectionReason;
  final DateTime? approvedAt;
  final DateTime? cancelledAt;
  final DateTime? createdAt;

  const Leave({
    required this.id,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    required this.status,
    required this.reason,
    this.attachmentPath,
    this.rejectionReason,
    this.approvedAt,
    this.cancelledAt,
    this.createdAt,
  });

  bool get isPending => status == LeaveStatus.pending;
  bool get isCancellable => status == LeaveStatus.pending;

  @override
  List<Object?> get props => [
    id, leaveType, startDate, endDate, totalDays, status, reason,
    attachmentPath, rejectionReason, approvedAt, cancelledAt, createdAt,
  ];
}