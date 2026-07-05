import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/di/injection_container.dart';
import '../../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../domain/entity/auth_identifier.dart';
import '../../../../domain/entity/auth_type.dart';
import '../../../../domain/entity/verification_type.dart';
import '../../welcome_to_work_mate_popup/view/welcome_to_work_mate_popup.dart';
import '../logic/verify_otp_cubit.dart';
import '../logic/verify_otp_state.dart';

class VerifyOtpPopUp extends StatelessWidget {
  final String identifier;

  const VerifyOtpPopUp._({required this.identifier});

  static Future<void> show(
      BuildContext context, {
        required String identifier,
        AuthType loginType = AuthType.email,
      }) {
    return PopupHelper.show(
      context: context,
      isDismissible: false,
      enableDrag: false,
      popup: BlocProvider(
        create: (_) => sl<VerifyOtpCubit>()
          ..setIdentifier(AuthIdentifier(value: identifier, type: loginType)),
        child: VerifyOtpPopUp._(identifier: identifier),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listenWhen: (previous, current) {
        return (current.isVerified && !previous.isVerified) ||
            (current.errorMessage != null && current.errorMessage != previous.errorMessage);
      },
      listener: (context, state) {
        if (state.isVerified) {
          Navigator.of(context).pop();
          SnackBarHelper.showSuccess(context, 'verification_success'.tr());
          PopupHelper.show(context: context, popup: const WelcomeToWorkMatePopUp());
          return;
        }

        if (state.errorMessage != null) {
          SnackBarHelper.showError(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<VerifyOtpCubit>();

        return CustomPopup.otpVerificationPopup(
          icon: Iconsax.sms_notification,
          title: 'verification_code_title'.tr(),
          description: 'verification_code_desc'.tr(args: [identifier]),
          primaryButtonText: 'submit'.tr(),
          isPrimaryButtonLoading: state.isLoading,
          isPrimaryButtonEnabled: state.isOtpComplete && !state.isLoading,
          enabled: !state.isLoading,
          primaryButtonOnPressed: () {
            cubit.verifyOtp(type: VerificationType.registration);
          },
          onOtpChanged: cubit.onOtpChanged,
          onResendOtp: cubit.resendOtp,
        );
      },
    );
  }
}