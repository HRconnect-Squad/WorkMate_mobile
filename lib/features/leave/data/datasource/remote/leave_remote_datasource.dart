import 'dto/leave_type_dto.dart';
import 'dto/request/submit_leave_request_dto.dart';
import 'dto/response/leave_balance_response_dto.dart';
import 'dto/response/submit_leave_response_dto.dart';

abstract class LeaveRemoteDataSource {
  Future<List<LeaveTypeDto>> getLeaveTypes();
  Future<List<LeaveRequestDto>> getMyLeaveRequests({String? status});
  Future<LeaveRequestDto> submitLeaveRequest(SubmitLeaveRequestDto request);
  Future<LeaveBalanceResponseDto> getLeaveBalance({int? year});
  Future<bool> cancelLeaveRequest(int id);
}