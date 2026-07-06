import '../../domain/entity/register.dart';
import '../../domain/entity/user.dart';
import '../../domain/entity/verify_otp.dart';
import '../data_source/remote/dto/request/register_dto_request.dart';
import '../data_source/remote/dto/request/verify_otp_request.dart';
import '../data_source/remote/dto/user_dto.dart';

class AuthMapper {
  static RegisterDtoRequest toRegisterDtoRequest(Register register) {
    return RegisterDtoRequest(
      email: register.email,
      password: register.password,
      passwordConfirmation: register.passwordConfirmation,
      phone: register.phone,
      loginType: register.authType.value,
    );
  }

  static VerifyOtpRequest toVerifyOtpDto(VerifyOTP verifyOtp) {
    return (VerifyOtpRequest(
      identifier: verifyOtp.identifier,
      code: verifyOtp.code,
      type: verifyOtp.type,
    ));
  }

  static User toDomain(UserDto? userDto) {
    return User(
      id: userDto?.id,
      email: userDto?.email,
      phone: userDto?.phone,
      isActive: parseIsActive(userDto?.isActive),
      role: userDto?.role,
    );
  }

  static bool parseIsActive(dynamic value) {
    if (value == null) return false;

    if (value is bool) {
      return value;
    }

    if (value is int) {
      return value == 1 ? true : false;
    }

    if (value is String) {
      if (value.toLowerCase() == 'true') return true;
      if (value.toLowerCase() == 'false') return false;
      return false;
    }
    return false;
  }
}
