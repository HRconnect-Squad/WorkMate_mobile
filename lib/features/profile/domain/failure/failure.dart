import '../../../../core/domain/failure/domain_failure.dart';

sealed class ProfileFailure extends Failure {
  const ProfileFailure(super.message);
}

class ProfileNotCompletedFailure extends ProfileFailure {
  const ProfileNotCompletedFailure([
    super.message = 'Profile not completed yet.',
  ]);
}

class ProfileUpdateFailure extends ProfileFailure {
  const ProfileUpdateFailure([
    super.message = 'Failed to update profile',
  ]);
}

class ProfileFetchFailure extends ProfileFailure {
  const ProfileFetchFailure([
    super.message = 'Failed to fetch profile',
  ]);
}

class ProfileImageUploadFailure extends ProfileFailure {
  const ProfileImageUploadFailure([
    super.message = 'Failed in image processing',
  ]);
}

class ProfileAlreadyExistsFailure extends ProfileFailure {
  const ProfileAlreadyExistsFailure([
    super.message = 'Profile already exists. Use update endpoint instead.',
  ]);
}