import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/data/exception/app_exception.dart';
import '../../../../../core/data/network/api_constants.dart';
import '../../../../../core/data/network/dio_client.dart';
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
    final queryParameters = <String, dynamic>{};

    if (status != null && status.isNotEmpty) {
      queryParameters['status'] = status;
    }
    if (category != null && category.isNotEmpty) {
      queryParameters['category'] = category;
    }

    final response = await _dioClient.get(
      ApiConstants.expenses,
      queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
    );

    final data = response.data['data'] as List<dynamic>;
    return data
        .map((json) => ExpenseDto.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<ExpenseDto> getExpenseDetail(int id) async {
    final response = await _dioClient.get(
      '${ApiConstants.expenses}/$id',
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return ExpenseDto.fromJson(data);
  }

  @override
  Future<ExpenseDto> createExpense({
    required CreateExpenseRequestDto request,
  }) async {
    final response = await _dioClient.post(
      ApiConstants.expenses,
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return ExpenseDto.fromJson(data);
  }

  @override
  Future<ExpenseDto> updateExpense({
    required int id,
    required UpdateExpenseRequestDto request,
  }) async {
    final response = await _dioClient.put(
      '${ApiConstants.expenses}/$id',
      data: request.toJson(),
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return ExpenseDto.fromJson(data);
  }

  @override
  Future<void> deleteExpense(int id) async {
    await _dioClient.delete('${ApiConstants.expenses}/$id');
  }

  @override
  Future<ReceiptUploadResponseDto> uploadReceipt(String filePath) async {
    final file = File(filePath);

    if (!file.existsSync()) {
      throw const ValidationException(message: 'Receipt file does not exist');
    }

    final fileName = file.path.split('/').last;
    final multipartFile = await MultipartFile.fromFile(
      filePath,
      filename: fileName,
    );

    final response = await _dioClient.uploadFiles(
      ApiConstants.uploadReceipt,
      files: {'receipt': multipartFile},
    );

    final data = response.data['data'] as Map<String, dynamic>;
    return ReceiptUploadResponseDto.fromJson(data);
  }
}