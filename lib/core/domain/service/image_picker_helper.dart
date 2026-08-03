import 'dart:io';
import 'package:file_picker/file_picker.dart';
import '../../config/app_constant.dart';

class ImagePickerHelper {
  static const int _compressionQuality = 0;

  ImagePickerHelper._();

  static Future<File?> pickImageFromGallery() {
    return _pickSingleFile(
      type: FileType.image,
      compressionQuality: _compressionQuality,
    );
  }

  static Future<File?> pickReceipt() {
    return _pickSingleFile(
      type: FileType.custom,
      allowedExtensions: const [
        'pdf',
        'jpg',
        'jpeg',
        'png',
      ],
      compressionQuality: _compressionQuality,
    );
  }

  static Future<List<File>> pickMultipleImages({
    int? maxImages,
  }) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.image,
        compressionQuality: _compressionQuality,
      );

      if (result == null) return [];

      var files = result.files
          .map((e) => e.path)
          .whereType<String>()
          .map(File.new)
          .where((file) => file.existsSync())
          .toList();

      if (maxImages != null) {
        files = files.take(maxImages).toList();
      }

      return files;
    } catch (_) {
      return [];
    }
  }

  static Future<File?> pickImageWithExtensions({
    List<String> allowedExtensions = const [
      'jpg',
      'jpeg',
      'png',
      'gif',
      'webp',
    ],
  }) {
    return _pickSingleFile(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
      compressionQuality: _compressionQuality,
    );
  }

  static Future<File?> _pickSingleFile({
    required FileType type,
    List<String>? allowedExtensions,
    int compressionQuality = _compressionQuality,
  }) async {
    try {
      final result = await FilePicker.pickFile(
        type: type,
        allowedExtensions: allowedExtensions,
        compressionQuality: compressionQuality,
      );

      final path = result?.path;

      if (path == null || path.isEmpty) {
        return null;
      }

      final file = File(path);

      return file.existsSync() ? file : null;
    } catch (_) {
      return null;
    }
  }

  static double getFileSizeInMB(File file) {
    return file.lengthSync() / (1024 * 1024);
  }

  static bool isFileSizeValid(
      File file, {
        double maxSizeMB = AppConstant.maxImageSizeMB,
      }) {
    return getFileSizeInMB(file) <= maxSizeMB;
  }

  static String getFileExtension(File file) {
    return file.path.split('.').last.toLowerCase();
  }

  static bool isValidImageExtension(File file) {
    return const [
      'jpg',
      'jpeg',
      'png',
      'gif',
      'webp',
    ].contains(getFileExtension(file));
  }

  static bool isValidReceiptExtension(File file) {
    return const [
      'jpg',
      'jpeg',
      'png',
      'pdf',
    ].contains(getFileExtension(file));
  }
}