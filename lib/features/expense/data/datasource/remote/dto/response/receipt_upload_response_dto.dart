class ReceiptUploadResponseDto {
  final String filename;
  final String originalName;
  final String path;
  final String url;
  final int size;

  const ReceiptUploadResponseDto({
    required this.filename,
    required this.originalName,
    required this.path,
    required this.url,
    required this.size,
  });

  factory ReceiptUploadResponseDto.fromJson(Map<String, dynamic> json) {
    return ReceiptUploadResponseDto(
      filename: json['filename'] as String? ?? '',
      originalName: json['original_name'] as String? ?? '',
      path: json['path'] as String? ?? '',
      url: json['url'] as String? ?? '',
      size: json['size'] as int? ?? 0,
    );
  }
}