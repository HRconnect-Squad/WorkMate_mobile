import 'package:easy_localization/easy_localization.dart';

import '../../config/app_constant.dart';

class Validators {
  Validators._();

  static final RegExp _emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  static final RegExp _phoneRegex = RegExp(r'^\d{10,15}$');

  static String? validateEmail(
      String? value, {
        bool required = true,
        String? requiredMessage,
        String? invalidMessage,
      }) {
    final email = value?.trim() ?? '';

    if (email.isEmpty) {
      if (required) {
        return requiredMessage ?? 'email_required'.tr();
      }
      return null;
    }

    if (!_emailRegex.hasMatch(email)) {
      return invalidMessage ?? 'invalid_email'.tr();
    }

    return null;
  }
  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email.trim());
  }
  
  static String? validatePhone(
      String? value, {
        bool required = true,
        int minDigits = AppConstant.minPhoneNumberLength,
        int maxDigits = AppConstant.maxPhoneNumberLength,
        String? requiredMessage,
        String? invalidMessage,
      }) {
    final phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      if (required) {
        return requiredMessage ?? 'phone_required'.tr();
      }
      return null;
    }

    if (!_phoneRegex.hasMatch(phone)) {
      return invalidMessage ?? 'invalid_phone'.tr();
    }

    final digitCount = phone.replaceAll('+', '').length;

    if (digitCount < minDigits || digitCount > maxDigits) {
      return invalidMessage ?? 'invalid_phone'.tr();
    }

    return null;
  }

  static bool isValidPhone(String phone, {
    int minDigits = AppConstant.minPhoneNumberLength,
    int maxDigits = AppConstant.maxPhoneNumberLength }) {
    final trimmed = phone.trim();

    if (!_phoneRegex.hasMatch(trimmed)) {
      return false;
    }

    final digitCount = trimmed.replaceAll('+', '').length;
    return digitCount >= minDigits && digitCount <= maxDigits;
  }


  static String? validatePassword(
      String? value, {
        bool required = true,
        int minLength = AppConstant.passwordLength,
        String? requiredMessage,
        String? minLengthMessage,
      }) {
    final password = value ?? '';

    if (password.isEmpty) {
      if (required) {
        return requiredMessage ?? 'password_required'.tr();
      }
      return null;
    }

    if (password.length < minLength) {
      return minLengthMessage ?? 'password_too_short'.tr();
    }

    return null;
  }

  static String? validatePasswordWithComplexity(
      String? value, {
        bool required = true,
        int minLength = AppConstant.passwordLength,
        bool requireUppercase = true,
        bool requireLowercase = true,
        bool requireNumber = true,
        bool requireSpecialChar = true,
        String? requiredMessage,
        String? minLengthMessage,
        String? complexityMessage,
      }) {
    final password = value ?? '';

    if (password.isEmpty) {
      if (required) {
        return requiredMessage ?? 'password_required'.tr();
      }
      return null;
    }

    if (password.length < minLength) {
      return minLengthMessage ?? 'password_too_short'.tr();
    }

    final hasUppercase = !requireUppercase || RegExp(r'[A-Z]').hasMatch(password);
    final hasLowercase = !requireLowercase || RegExp(r'[a-z]').hasMatch(password);
    final hasNumber = !requireNumber || RegExp(r'[0-9]').hasMatch(password);
    final hasSpecialChar = !requireSpecialChar || RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

    if (!hasUppercase || !hasLowercase || !hasNumber || !hasSpecialChar) {
      return complexityMessage ?? 'password_complexity'.tr();
    }

    return null;
  }

  static bool isValidPassword(String password, {int minLength = 8}) {
    return password.length >= minLength;
  }

  static String? validateConfirmPassword(
      String? confirmPassword,
      String? password, {
        bool required = true,
        String? requiredMessage,
        String? mismatchMessage,
      }) {
    final confirm = confirmPassword ?? '';
    final original = password ?? '';

    if (confirm.isEmpty) {
      if (required) {
        return requiredMessage ?? 'confirm_password_required'.tr();
      }
      return null;
    }

    if (confirm != original) {
      return mismatchMessage ?? 'passwords_not_match'.tr();
    }

    return null;
  }

  static String? validateOtp(
      String? value, {
        bool required = true,
        int length = AppConstant.otpLength,
        String? requiredMessage,
        String? invalidMessage,
      }) {
    final otp = value?.trim() ?? '';

    if (otp.isEmpty) {
      if (required) {
        return requiredMessage ?? 'otp_required'.tr();
      }
      return null;
    }

    if (otp.length != length || !RegExp(r'^\d+$').hasMatch(otp)) {
      return invalidMessage ?? 'otp_length_error'.tr();
    }

    return null;
  }

  static bool isOtpComplete(String otp, {int length = 6}) {
    return otp.trim().length == length;
  }

  static String? validateRequired(
      String? value, {
        String? message,
      }) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'field_required'.tr();
    }
    return null;
  }

  static String? validateMinLength(
      String? value, {
        required int minLength,
        String? message,
      }) {
    if (value != null && value.length < minLength) {
      return message ?? 'min_length_error'.tr(args: [minLength.toString()]);
    }
    return null;
  }

  static String? validateMaxLength(
      String? value, {
        required int maxLength,
        String? message,
      }) {
    if (value != null && value.length > maxLength) {
      return message ?? 'max_length_error'.tr(args: [maxLength.toString()]);
    }
    return null;
  }

  static String? validateIdentifier(
      String? value, {
        required bool isEmail,
        bool required = true,
      }) {
    if (isEmail) {
      return validateEmail(value, required: required);
    } else {
      return validatePhone(value, required: required);
    }
  }
}