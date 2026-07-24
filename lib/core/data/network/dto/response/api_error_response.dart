import '../../../../domain/failure/validation_error.dart';

class ApiErrorResponse {
  final bool success;
  final String message;
  final String? errorCode;
  final ValidationErrors? validationErrors;

  const ApiErrorResponse({
    required this.success,
    required this.message,
    this.errorCode,
    this.validationErrors,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      errorCode: json['error_code'] as String?,
      validationErrors: json['data'] is Map<String, dynamic>
          ? _parseValidationErrors(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  static ValidationErrors _parseValidationErrors(Map<String, dynamic> json) {
    return ValidationErrors(
      json.map(
            (key, value) => MapEntry(
          key,
          value is List
              ? value.map((e) => e.toString()).toList()
              : <String>[value.toString()],
        ),
      ),
    );
  }

  bool get hasValidationErrors => validationErrors != null;

  bool hasErrorCode(String code) =>
      errorCode?.toUpperCase() == code.toUpperCase();
}