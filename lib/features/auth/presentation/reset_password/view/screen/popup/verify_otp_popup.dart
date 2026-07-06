import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/di/injection_container.dart';
import '../../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../domain/entity/auth_type.dart';
import '../../../../forget_password/logic/forgot_password_cubit.dart';
import '../../../../forget_password/logic/forgot_password_state.dart';
import 'reset_password_popup.dart';

class VerifyOtpPopup extends StatefulWidget {
  const VerifyOtpPopup._({
    required this.identifier,
    required this.loginType,
  });

  final String identifier;
  final AuthType loginType;

  static Future<void> show(
      BuildContext context, {
        required String identifier,
        required AuthType loginType,
      }) {
    return PopupHelper.show(
      isDismissible: false,
      enableDrag: false,
      context: context,
      popup: BlocProvider(
        create: (_) => sl<ForgotPasswordCubit>(),
        child: VerifyOtpPopup._(
          identifier: identifier,
          loginType: loginType,
        ),
      ),
    );
  }

  @override
  State<VerifyOtpPopup> createState() => _VerifyOtpPopupState();
}

class _VerifyOtpPopupState extends State<VerifyOtpPopup> {
  String _otp = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) {
        return (current.isSuccess && !previous.isSuccess) ||
            (current.apiError != null &&
                current.apiError != previous.apiError);
      },
      listener: (context, state) {
        if (state.isSuccess) {
          SnackBarHelper.showSuccess(context, 'OTP sent successfully!');
        }

        if (state.apiError != null) {
          SnackBarHelper.showError(context, state.apiError!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ForgotPasswordCubit>();
        final isOtpComplete = _otp.length == 6;

        return CustomPopup.otpVerificationPopup(
          icon: Iconsax.security_safe4,
          title: 'Forgot Password',
          description: 'A reset code has been sent to ${widget.identifier}, check your email to continue the password reset process.',
          onOtpChanged: (value) {
            setState(() => _otp = value);
          },
          onResendOtp: () {
            cubit.onEmailChanged(widget.identifier);
            cubit.submit();
          },
          enabled: !state.isLoading,
          primaryButtonText: 'Submit',
          isPrimaryButtonLoading: state.isLoading,
          isPrimaryButtonEnabled: isOtpComplete && !state.isLoading,
          primaryButtonOnPressed: () {
            Navigator.of(context).pop();
            ResetPasswordPopup.show(
              context,
              identifier: widget.identifier,
              otp: _otp,
            );
          },
        );
      },
    );
  }
}