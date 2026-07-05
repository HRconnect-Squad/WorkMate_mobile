import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/di/injection_container.dart';
import '../../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../domain/entity/auth_identifier.dart';
import '../../../../../domain/entity/auth_type.dart';
import '../../../logic/verify_forgot_password_otp_cubit.dart';
import '../../../logic/verify_forgot_password_otp_state.dart';
import '../../../../reset_password/view/screen/popup/reset_password_popup.dart';

class VerifyForgotPasswordOtpPopup extends StatelessWidget {
  const VerifyForgotPasswordOtpPopup._({required this.identifier});

  final String identifier;

  static Future<void> show(BuildContext context, {required String identifier}) {
    return PopupHelper.show(
      context: context,
      isDismissible: false,
      enableDrag: false,
      popup: BlocProvider(
        create: (_) => sl<VerifyForgotPasswordOtpCubit>()
          ..setIdentifier(AuthIdentifier(value: identifier, type: AuthType.email)),
        child: VerifyForgotPasswordOtpPopup._(identifier: identifier),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyForgotPasswordOtpCubit, VerifyForgotPasswordOtpState>(
      listenWhen: (previous, current) =>
      (current.isVerified && !previous.isVerified) ||
          (current.errorMessage != null && current.errorMessage != previous.errorMessage),
      listener: (context, state) {
        if (state.isVerified) {
          Navigator.of(context).pop();
          ResetPasswordPopup.show(
            context,
            identifier: state.identifier.value,
            otp: state.code,
          );
          return;
        }
        if (state.errorMessage != null) {
          SnackBarHelper.showError(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<VerifyForgotPasswordOtpCubit>();

        return CustomPopup.otpVerificationPopup(
          icon: Iconsax.security_safe4,
          title: 'Forgot Password',
          description:
          'A reset code has been sent to $identifier, check your email to continue the password reset process.',
          onOtpChanged: cubit.onOtpChanged,
          onResendOtp: cubit.resendOtp,
          enabled: !state.isLoading,
          primaryButtonText: 'Submit',
          isPrimaryButtonLoading: state.isLoading,
          isPrimaryButtonEnabled: state.isOtpComplete && !state.isLoading,
          primaryButtonOnPressed: cubit.checkOtp,
        );
      },
    );
  }
}