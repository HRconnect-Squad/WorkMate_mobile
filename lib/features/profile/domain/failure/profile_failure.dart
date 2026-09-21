import '../../../../core/domain/failure/domain_failure.dart';

sealed class ProfileFailure extends Failure {
  const ProfileFailure({required super.message});
}
class ProfileNotCompletedFailure extends ProfileFailure {
  const ProfileNotCompletedFailure({
    super.message = 'Profile not completed yet',
  });
}

class ProfileAlreadyExistsFailure extends ProfileFailure {
  const ProfileAlreadyExistsFailure({
    super.message = 'Profile already exists. Use update endpoint instead',
  });
}

class ProfileImageUploadFailure extends ProfileFailure {
  const ProfileImageUploadFailure({
    super.message = 'Failed to upload profile image',
  });
}