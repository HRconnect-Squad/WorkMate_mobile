class UploadImageResponseDto {
  final String filename;
  final String path;
  final String url;

  const UploadImageResponseDto({
    required this.filename,
    required this.path,
    required this.url,
  });

  factory UploadImageResponseDto.fromJson(Map<String, dynamic> json) {
    return UploadImageResponseDto(
      filename: json['filename'] as String,
      path: json['path'] as String,
      url: json['url'] as String,
    );
  }
}