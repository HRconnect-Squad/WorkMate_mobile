import '../../../domain/enitity/attendance_details_entity.dart';

class DetailsHistoryCardState {
  final bool isLoading;
  final String? apiError;
  final AttendanceDetailsEntity? details;
  final bool isExportingPdf;
  final bool pdfExportSuccess;
  final String? pdfFilePath;
  final String? pdfError;

  const DetailsHistoryCardState({
    this.isLoading = false,
    this.apiError,
    this.details,
    this.isExportingPdf = false,
    this.pdfExportSuccess = false,
    this.pdfFilePath,
    this.pdfError,
  });

  bool get hasData => details != null;

  DetailsHistoryCardState copyWith({
    bool? isLoading,
    String? apiError,
    bool clearApiError = false,
    AttendanceDetailsEntity? details,
    bool? isExportingPdf,
    bool? pdfExportSuccess,
    String? pdfFilePath,
    String? pdfError,
    bool clearPdfError = false,
  }) {
    return DetailsHistoryCardState(
      isLoading: isLoading ?? this.isLoading,
      apiError: clearApiError ? null : (apiError ?? this.apiError),
      details: details ?? this.details,
      isExportingPdf: isExportingPdf ?? this.isExportingPdf,
      pdfExportSuccess: pdfExportSuccess ?? this.pdfExportSuccess,
      pdfFilePath: pdfFilePath ?? this.pdfFilePath,
      pdfError: clearPdfError ? null : (pdfError ?? this.pdfError),
    );
  }
}