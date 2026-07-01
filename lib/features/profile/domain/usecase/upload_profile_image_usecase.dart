import 'package:fpdart/fpdart.dart';
import '../../../../core/domain/failure/domain_failure.dart';
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

    return _repository.uploadProfileImage(filePath);
  }
}