import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:workmate/features/attendance/data/data_source/remote/dto/attendance_details_dto.dart';

import '../../../../../core/data/network/constant/api_constant.dart';
import '../../../../../core/data/network/dio_client.dart';
import '../../../../../core/data/network/dto/response/api_response.dart';
import 'attendance_remote_data_source.dart';
import 'dto/attendance_record_response.dart';
import 'dto/break_response.dart';
import 'dto/clock_in_attendance_request.dart';
import 'dto/history_attendance_response.dart';

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final DioClient _dioClient;

  const AttendanceRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;
  @override
  Future<HistoryAttendanceResponse> attendanceHistory() async {
    final response = await _dioClient.get(ApiConstants.attendanceHistory);
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => HistoryAttendanceResponse.fromJson(data),
    );
    return apiResponse.requiredData;
  }

  @override
  Future<AttendanceRecordResponse> clockInAttendance(
      ClockInAttendanceRequest clockInAttendanceRequest,
      ) async {
    final response = await _dioClient.uploadFiles(
      path: ApiConstants.attendanceCheckIn,
      files: {
        'proof_image': await MultipartFile.fromFile(
          clockInAttendanceRequest.proofImage,
          filename: clockInAttendanceRequest.proofImage.split('/').last,
        ),
      },
      extraFields: {
        'latitude': clockInAttendanceRequest.latitude,
        'longitude': clockInAttendanceRequest.longitude,
        'notes': clockInAttendanceRequest.notes,
      },
    );
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => AttendanceRecordResponse.fromJson(data),
    );
    return apiResponse.requiredData;
  }

  @override
  Future<AttendanceRecordResponse> attendanceClockOut() async {
    final response = await _dioClient.post(ApiConstants.attendanceCheckOut);
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => AttendanceRecordResponse.fromJson(data),
    );
    return apiResponse.requiredData;
  }

  @override
  Future<BreakResponse> startAttendanceBreak() async {
    final response = await _dioClient.post(ApiConstants.startAttendanceBreak);
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => BreakResponse.fromJson(data),
    );
    return apiResponse.requiredData;
  }

  @override
  Future<BreakResponse> endAttendanceBreak() async {
    final response = await _dioClient.post(ApiConstants.endAttendanceBreak);
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => BreakResponse.fromJson(data),
    );
    return apiResponse.requiredData;
  }

  @override
  Future<AttendanceRecordResponse> attendanceToday() async {
    final response = await _dioClient.get(ApiConstants.attendanceToday);

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => AttendanceRecordResponse.fromJson(data),
    );

    return  apiResponse.data ?? AttendanceRecordResponse();
  }

  @override
  Future<AttendanceDetailsDataDto> attendanceDetailsById(String id) async {
    final response = await _dioClient.get(
      ApiConstants.attendanceDetails(id),
    );
    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => AttendanceDetailsDataDto.fromJson(data),
    );
    return apiResponse.requiredData;
  }
}
