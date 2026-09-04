import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/data/exception/app_exception.dart';
import '../../../../../core/data/network/dio_client.dart';
import '../../../../../core/data/network/dto/response/api_response.dart';
import '../../constant/expense_api_constant.dart';
import 'dto/expense_dto.dart';
import 'dto/request/create_expense_request_dto.dart';
import 'dto/request/update_expense_request_dto.dart';
import 'dto/response/receipt_upload_response_dto.dart';
import 'expense_remote_data_source.dart';

class ExpensesRemoteDataSourceImpl implements ExpensesRemoteDataSource {
  final DioClient _dioClient;

  const ExpensesRemoteDataSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<List<ExpenseDto>> getExpenses({
    String? status,
    String? category,
  }) async {
    final queryParameters = <String, dynamic>{
      if (status != null && status.isNotEmpty) 'status': status,
      if (category != null && category.isNotEmpty) 'category': category,
    };

    final response = await _dioClient.get(
      ExpenseApiConstant.expenses,
      queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => (data as List<dynamic>)
          .map((item) => ExpenseDto.fromJson(item as Map<String, dynamic>))
          .toList(),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<ExpenseDto> getExpenseDetail(int id) async {
    final response = await _dioClient.get(
      '${ExpenseApiConstant.expenses}/$id',
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => ExpenseDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<ExpenseDto> createExpense({
    required CreateExpenseRequestDto request,
  }) async {
    final response = await _dioClient.post(
      ExpenseApiConstant.expenses,
      data: request.toJson(),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => ExpenseDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<ExpenseDto> updateExpense({
    required int id,
    required UpdateExpenseRequestDto request,
  }) async {
    final response = await _dioClient.put(
      '${ExpenseApiConstant.expenses}/$id',
      data: request.toJson(),
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => ExpenseDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }

  @override
  Future<void> deleteExpense(int id) async {
    await _dioClient.delete('${ExpenseApiConstant.expenses}/$id');
  }

  @override
  Future<ReceiptUploadResponseDto> uploadReceipt(String filePath) async {
    final file = File(filePath);

    if (!file.existsSync()) {
      throw FileException(
        message: 'File not found at path: $filePath',
      );
    }

    final multipartFile = await MultipartFile.fromFile(
      filePath,
      filename: filePath.split('/').last,
    );

    final response = await _dioClient.uploadFiles(
      path: ExpenseApiConstant.uploadReceipt,
      files: {'receipt': multipartFile},
    );

    final apiResponse = ApiResponse.fromJson(
      response.data,
          (data) => ReceiptUploadResponseDto.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.requiredData;
  }
}