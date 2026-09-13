import '../leave_type_dto.dart';

class LeaveRequestDto {
  final int? id;
  final String? startDate;
  final String? endDate;
  final int? totalDays;
  final String? reason;
  final String? attachment;
  final String? status;
  final String? rejectionReason;
  final String? approvedAt;
  final String? cancelledAt;
  final LeaveTypeDto? leaveType;
  final String? createdAt;
  final String? updatedAt;

  const LeaveRequestDto({
    this.id, this.startDate, this.endDate, this.totalDays,
    this.reason, this.attachment, this.status, this.rejectionReason,
    this.approvedAt, this.cancelledAt, this.leaveType,
    this.createdAt, this.updatedAt,
  });

  factory LeaveRequestDto.fromJson(Map<String, dynamic> json) {
    return LeaveRequestDto(
      id: json['id'] as int?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      totalDays: json['total_days'] as int?,
      reason: json['reason'] as String?,
      attachment: json['attachment'] as String?,
      status: json['status'] as String?,
      rejectionReason: json['rejection_reason'] as String?,
      approvedAt: json['approved_at'] as String?,
      cancelledAt: json['cancelled_at'] as String?,
      leaveType: json['leave_type'] != null
          ? LeaveTypeDto.fromJson(json['leave_type'] as Map<String, dynamic>)
          : null,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}