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
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? 'An error occurred while processing your request.',
      errorCode: json['error_code'] as String?,
      validationErrors: json['data'] is Map<String, dynamic>
          ? _parseValidationErrors(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  static ValidationErrors? _parseValidationErrors(Map<String, dynamic> json) {
    if (json.isEmpty) return null;

    final fields = <String, List<String>>{};

    json.forEach((key, value) {
      if (value is List) {
        final stringValues = value
            .where((e) => e != null)
            .map((e) => e.toString())
            .toList();

        if (stringValues.isNotEmpty) {
          fields[key] = stringValues;
        }
      } else if (value != null) {
        fields[key] = [value.toString()];
      }
    });

    return fields.isEmpty ? null : ValidationErrors(fields);
  }

  bool get hasValidationErrors => validationErrors != null;

  bool hasErrorCode(String code) =>
      errorCode?.toUpperCase() == code.toUpperCase();
}