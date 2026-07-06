import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../../config/app_constant.dart';

class ImagePickerHelper {
  static const int compressionQuality = 50;

  ImagePickerHelper._();

  static Future<File?> pickImageFromGallery() async {
    try {
      final result = await FilePicker.pickFile(
        type: FileType.image,
        compressionQuality: compressionQuality,
      );

      if (result == null || result.path == null || result.path!.isEmpty) {
        return null;
      }

      final file = File(result.path!);
      if (!file.existsSync()) {
        return null;
      }

      return file;
    } catch (e) {
      return null;
    }
  }

  static Future<File?> pickReceipt() async {
    try {
      final result = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        compressionQuality: compressionQuality,
      );

      if (result == null || result.path == null || result.path!.isEmpty) {
        return null;
      }

      final file = File(result.path!);
      if (!file.existsSync()) return null;

      return file;
    } catch (e) {
      return null;
    }
  }

  static Future<List<File>> pickMultipleImages({int? maxImages}) async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.image,
        compressionQuality: compressionQuality,
      );

      if (result == null || result.files.isEmpty) {
        return [];
      }

      var files = result.files
          .where((file) => file.path != null && file.path!.isNotEmpty)
          .map((file) => File(file.path!))
          .where((file) => file.existsSync())
          .toList();

      if (maxImages != null && files.length > maxImages) {
        files = files.take(maxImages).toList();
      }

      return files;
    } catch (e) {
      return [];
    }
  }

  static Future<File?> pickImageWithExtensions({
    List<String> allowedExtensions = const ['jpg', 'jpeg', 'png', 'gif', 'webp'],
  }) async {
    try {
      final result = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        compressionQuality: 50,
      );

      if (result == null || result.path == null || result.path!.isEmpty) {
        return null;
      }

      return File(result.path!);
    } catch (e) {
      return null;
    }
  }

  static double getFileSizeInMB(File file) {
    final bytes = file.lengthSync();
    return bytes / (1024 * 1024);
  }

  static bool isFileSizeValid(File file, {double maxSizeMB = AppConstant.maxImageSizeMB}) {
    return getFileSizeInMB(file) <= maxSizeMB;
  }

  static String getFileExtension(File file) {
    return file.path.split('.').last.toLowerCase();
  }

  static bool isValidImageExtension(File file) {
    final validExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
    return validExtensions.contains(getFileExtension(file));
  }

  static bool isValidReceiptExtension(File file) {
    final validExtensions = ['jpg', 'jpeg', 'png', 'pdf'];
    return validExtensions.contains(getFileExtension(file));
  }
}