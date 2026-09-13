import '../../../../core/data/util/parsing.dart';
import '../../domain/entity/leave_balance.dart';
import '../../domain/entity/leave.dart';
import '../../domain/entity/leave_status.dart';
import '../../domain/entity/leave_type.dart';
import '../datasource/remote/dto/leave_type_dto.dart';
import '../datasource/remote/dto/response/leave_balance_response_dto.dart';
import '../datasource/remote/dto/response/submit_leave_response_dto.dart';

class LeaveMapper {
  LeaveMapper._();

  static LeaveType toLeaveTypeDomain(LeaveTypeDto dto) {
    return LeaveType(
      id: dto.id ?? 0,
      name: dto.name ?? '',
      code: dto.code,
      description: dto.description,
      daysPerYear: dto.daysPerYear ?? 0,
      isPaid: dto.isPaid ?? false,
      requiresApproval: dto.requiresApproval ?? true,
      isActive: dto.isActive ?? true,
      maxConsecutiveDays: dto.maxConsecutiveDays,
    );
  }

  static List<LeaveType> toLeaveTypeDomainList(List<LeaveTypeDto> dtos) =>
      dtos.map(toLeaveTypeDomain).toList();

  static Leave toDomain(LeaveRequestDto dto) {
    return Leave(
      id: dto.id ?? 0,
      leaveType: dto.leaveType != null ? toLeaveTypeDomain(dto.leaveType!) : LeaveType.empty,
      startDate: DataFormat.parseDate(dto.startDate) ?? DateTime.now(),
      endDate: DataFormat.parseDate(dto.endDate) ?? DateTime.now(),
      totalDays: dto.totalDays ?? 0,
      status: LeaveStatus.fromString(dto.status ?? 'pending'),
      reason: dto.reason ?? '',
      attachmentPath: dto.attachment,
      rejectionReason: dto.rejectionReason,
      approvedAt: DataFormat.parseDateTime(dto.approvedAt),
      cancelledAt: DataFormat.parseDateTime(dto.cancelledAt),
      createdAt: DataFormat.parseDateTime(dto.createdAt),
    );
  }

  static List<Leave> toDomainList(List<LeaveRequestDto> dtos) => dtos.map(toDomain).toList();

  static LeaveBalanceSummary toBalanceDomain(LeaveBalanceResponseDto dto) {
    return LeaveBalanceSummary(
      year: dto.year ?? DateTime.now().year,
      balances: (dto.balance ?? [])
          .map((item) => LeaveBalanceItem(
        leaveType: item.leaveType != null ? toLeaveTypeDomain(item.leaveType!) : LeaveType.empty,
        totalDays: item.totalDays ?? 0,
        usedDays: item.usedDays ?? 0,
        remainingDays: item.remainingDays ?? 0,
      ))
          .toList(),
    );
  }
}