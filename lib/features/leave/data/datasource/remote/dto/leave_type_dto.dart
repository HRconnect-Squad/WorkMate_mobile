class LeaveTypeDto {
  final int? id;
  final String? name;
  final String? code;
  final String? description;
  final int? daysPerYear;
  final bool? isPaid;
  final bool? requiresApproval;
  final bool? isActive;
  final int? maxConsecutiveDays;
  final String? createdAt;

  const LeaveTypeDto({
    this.id, this.name, this.code, this.description,
    this.daysPerYear, this.isPaid, this.requiresApproval,
    this.isActive, this.maxConsecutiveDays, this.createdAt,
  });

  factory LeaveTypeDto.fromJson(Map<String, dynamic> json) {
    return LeaveTypeDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      daysPerYear: json['days_per_year'] as int?,
      isPaid: json['is_paid'] as bool?,
      requiresApproval: json['requires_approval'] as bool?,
      isActive: json['is_active'] as bool?,
      maxConsecutiveDays: json['max_consecutive_days'] as int?,
      createdAt: json['created_at'] as String?,
    );
  }
}