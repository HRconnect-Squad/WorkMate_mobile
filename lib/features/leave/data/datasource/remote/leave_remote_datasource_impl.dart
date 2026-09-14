import '../../../../../core/data/network/dio_client.dart';
import '../../../../../core/data/network/dto/response/api_response.dart';
import '../../constant/leave_api_constant.dart';
import 'dto/leave_type_dto.dart';
import 'dto/request/submit_leave_request_dto.dart';
import 'dto/response/leave_balance_response_dto.dart';
import 'dto/response/submit_leave_response_dto.dart';
import 'leave_remote_datasource.dart';

class LeaveRemoteDataSourceImpl implements LeaveRemoteDataSource {
  final DioClient _dioClient;

  const LeaveRemoteDataSourceImpl({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<List<LeaveTypeDto>> getLeaveTypes() async {
    final response = await _dioClient.get(LeaveApiConstant.getLeaveTypes);
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => (data as List<dynamic>)
          .map((item) => LeaveTypeDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    return apiResponse.requiredData;
  }

  @override
  Future<List<LeaveRequestDto>> getMyLeaveRequests({String? status}) async {
    final response = await _dioClient.get(
      LeaveApiConstant.getLeaveRequests,
      queryParameters: status != null ? {'status': status} : null,
    );
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => (data as List<dynamic>)
          .map((item) => LeaveRequestDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    return apiResponse.requiredData;
  }

  @override
  Future<LeaveRequestDto> submitLeaveRequest(SubmitLeaveRequestDto request) async {
    final response = await _dioClient.post(LeaveApiConstant.createLeaveRequest, data: request.toJson());
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => LeaveRequestDto.fromJson(data as Map<String, dynamic>),
    );
    return apiResponse.requiredData;
  }

  @override
  Future<LeaveBalanceResponseDto> getLeaveBalance({int? year}) async {
    final response = await _dioClient.get(
      LeaveApiConstant.getLeaveBalance,
      queryParameters: year != null ? {'year': year} : null,
    );
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => LeaveBalanceResponseDto.fromJson(data as Map<String, dynamic>),
    );
    return apiResponse.requiredData;
  }

  @override
  Future<bool> cancelLeaveRequest(int id) async {
    final response = await _dioClient.delete(LeaveApiConstant.leaveDetail(id));
    final apiResponse = ApiResponse.fromJson(
      response.data,
      null
    );
    return apiResponse.success;
  }
}