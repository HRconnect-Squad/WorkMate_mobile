class PdfExportResult {
  final bool isSuccess;
  final String? filePath;
  final String? errorMessage;

  const PdfExportResult._({
    required this.isSuccess,
    this.filePath,
    this.errorMessage,
  });

  factory PdfExportResult.success(String path) => PdfExportResult._(
    isSuccess: true,
    filePath: path,
  );

  factory PdfExportResult.failure(String message) => PdfExportResult._(
    isSuccess: false,
    errorMessage: message,
  );
}