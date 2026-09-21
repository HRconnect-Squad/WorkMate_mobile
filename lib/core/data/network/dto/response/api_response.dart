import '../../../exception/app_exception.dart';

class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final Pagination? pagination;

  const ApiResponse({
    required this.success,
    required this.message,
    this.data,
    this.pagination,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic json)? fromJsonT,
      ) {
    return ApiResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : null,
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  T get requiredData {
    if (data == null) {
      throw const SerializationException(
        message: 'Expected response data but received null',
      );
    }
    return data as T;
  }
}

class Pagination {
  final int currentPage;
  final int totalPages;
  final int limit;
  final int totalItems;

  const Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.limit,
    required this.totalItems,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['page'] as int? ?? 1,
      totalPages: json['totalPages'] as int? ?? 1,
      limit: json['limit'] as int? ?? 20,
      totalItems: json['totalItems'] as int? ?? 0,
    );
  }

  bool get hasNextPage => currentPage < totalPages;

  bool get isFirstPage => currentPage == 1;
}