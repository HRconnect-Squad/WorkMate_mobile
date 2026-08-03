import 'dart:io';

import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/domain/service/image_picker_helper.dart';
import '../repository/profile_repository.dart';


class UploadProfileImageUseCase {
  final ProfileRepository _repository;

  const UploadProfileImageUseCase(this._repository);

  Future<Either<Failure, String>> call(String filePath) {
    if (filePath.trim().isEmpty) {
      return Future.value(
        const Left(ValidationFailure(message: 'Image file path cannot be empty')),
      );
    }

    final file = File(filePath);
    if (!file.existsSync()) {
      return Future.value(
        const Left(ValidationFailure(message: 'Selected image file was not found')),
      );
    }

    if (!ImagePickerHelper.isValidImageExtension(file)) {
      return Future.value(
        const Left(ValidationFailure(
          message: 'Unsupported image format. Please use JPG or PNG',
        )),
      );
    }

    if (!ImagePickerHelper.isFileSizeValid(file)) {
      return Future.value(
        const Left(ValidationFailure(message: 'Image size is too large')),
      );
    }

    return _repository.uploadProfileImage(filePath);
  }
}