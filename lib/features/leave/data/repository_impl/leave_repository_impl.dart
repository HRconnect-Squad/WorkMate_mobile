import 'package:fpdart/fpdart.dart';

import '../../../../core/data/network/helper/safe_api_call.dart';
import '../../../../core/data/util/parsing.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../domain/entity/leave_balance.dart';
import '../../domain/entity/leave.dart';
import '../../domain/entity/leave_status.dart';
import '../../domain/entity/leave_type.dart';
import '../../domain/repository/leave_repository.dart';
import '../datasource/remote/dto/request/submit_leave_request_dto.dart';
import '../datasource/remote/leave_remote_datasource.dart';
import '../mapper/leave_failure_mapper.dart';
import '../mapper/leave_mapper.dart';

class LeaveRepositoryImpl with SafeApiCall implements LeaveRepository {
  final LeaveRemoteDataSource _remoteDataSource;

  const LeaveRepositoryImpl({required LeaveRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<LeaveType>>> getLeaveTypes() =>
      safeApiCall(
        call: () async {
          final dtos = await _remoteDataSource.getLeaveTypes();
          return LeaveMapper.toLeaveTypeDomainList(dtos);
        },
        onException: LeaveFailureMapper.fromException,
      );

  @override
  Future<Either<Failure, List<Leave>>> getMyLeaveRequests({LeaveStatus? status}) =>
      safeApiCall(
        call: () async {
          final dtos = await _remoteDataSource.getMyLeaveRequests(status: status?.name);
          return LeaveMapper.toDomainList(dtos);
        },
        onException: LeaveFailureMapper.fromException,
      );

  @override
  Future<Either<Failure, Leave>> submitLeaveRequest({
    required int leaveTypeId,
    required DateTime startDate,
    required DateTime endDate,
    required String reason,
    String? attachmentPath,
  }) =>
      safeApiCall(
        call: () async {
          final request = SubmitLeaveRequestDto(
            leaveTypeId: leaveTypeId,
            startDate: DataFormat.formatDate(startDate),
            endDate: DataFormat.formatDate(endDate),
            reason: reason,
            attachment: attachmentPath,
          );
          final dto = await _remoteDataSource.submitLeaveRequest(request);
          return LeaveMapper.toDomain(dto);
        },
        onException: LeaveFailureMapper.fromException,
      );

  @override
  Future<Either<Failure, LeaveBalanceSummary>> getLeaveBalance({int? year}) =>
      safeApiCall(
        call: () async {
          final dto = await _remoteDataSource.getLeaveBalance(year: year);
          return LeaveMapper.toBalanceDomain(dto);
        },
        onException: LeaveFailureMapper.fromException,
      );

  @override
  Future<Either<Failure, bool>> cancelLeaveRequest(int id) =>
      safeApiCall(
        call: () async {
          return await _remoteDataSource.cancelLeaveRequest(id);
        },
        onException: LeaveFailureMapper.fromException,
      );
}