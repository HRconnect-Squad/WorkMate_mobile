import 'package:easy_localization/easy_localization.dart';

import '../../../../core/domain/failure/domain_failure.dart';
import '../../../../core/presentation/mapper/failure_ui_mapper.dart';
import '../../domain/failures/failure.dart';

class AuthFailureUiMapper {
  const AuthFailureUiMapper._();

  static String map(Failure failure) {
    return switch (failure) {
      AccountNotVerifiedFailure()     => 'account_not_verified_error'.tr(),
      InvalidCredentialsFailure()     => 'invalid_credentials_error'.tr(),
      SessionExpiredFailure()         => 'session_expired_error'.tr(),
      UserNotFoundFailure()           => 'user_not_found_error'.tr(),
      InvalidOtpFailure()             => 'invalid_otp_error'.tr(),
      EmailAlreadyExistsFailure()     => 'email_exists_error'.tr(),
      PhoneAlreadyExistsFailure()     => 'phone_exists_error'.tr(),
      AccountDisabledFailure()        => 'account_disabled_error'.tr(),
      SamePasswordFailure()           => 'same_password_error'.tr(),
      InvalidCurrentPasswordFailure() => 'invalid_current_password_error'.tr(),
      ChangePasswordFailure()         => 'change_password_failed_error'.tr(),
      _ => FailureUiMapper.map(failure),
    };
  }
}