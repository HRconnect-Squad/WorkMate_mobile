import 'package:easy_localization/easy_localization.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/presentation/mapper/failure_ui_mapper.dart';
import '../../domain/failure/failure.dart';
import '../../domain/failure/payroll_failure.dart';

class ProfileFailureUiMapper {
  const ProfileFailureUiMapper._();

  static String map(Failure failure) {
    return switch (failure) {
      ProfileNotCompletedFailure()  => 'profile_not_completed_error'.tr(),
      ProfileAlreadyExistsFailure() => 'profile_already_exists_error'.tr(),
      ProfileImageUploadFailure()   => 'profile_image_upload_error'.tr(),
      PayrollNotFoundFailure()      => 'payroll_not_found_error'.tr(),
      PayrollExportFailure()        => 'payroll_export_error'.tr(),
      _ => FailureUiMapper.map(failure),
    };
  }
}