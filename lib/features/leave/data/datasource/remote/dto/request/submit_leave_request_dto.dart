class SubmitLeaveRequestDto {
  final int leaveTypeId;
  final String startDate;
  final String endDate;
  final String reason;
  final String? attachment;

  const SubmitLeaveRequestDto({
    required this.leaveTypeId,
    required this.startDate,
    required this.endDate,
    required this.reason,
    this.attachment,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'leave_type_id': leaveTypeId,
      'start_date': startDate,
      'end_date': endDate,
      'reason': reason,
    };
    if (attachment != null && attachment!.isNotEmpty) {
      data['attachment'] = attachment;
    }
    return data;
  }
}