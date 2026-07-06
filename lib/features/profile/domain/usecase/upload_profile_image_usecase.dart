import 'package:fpdart/fpdart.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../repository/profile_repository.dart';

class UploadProfileImageUseCase {
  final ProfileRepository _repository;

  const UploadProfileImageUseCase(this._repository);

  Future<Either<Failure, String>> call(String filePath) {
    return _repository.uploadProfileImage(filePath);
  }
}