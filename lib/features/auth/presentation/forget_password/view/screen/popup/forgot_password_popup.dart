import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/core/di/injection_container.dart';
import 'package:workmate/features/auth/presentation/forget_password/logic/forgot_password_cubit.dart';
import 'package:workmate/features/auth/presentation/forget_password/logic/forgot_password_state.dart';
import 'package:workmate/features/auth/presentation/reset_password/view/screen/popup/verify_otp_popup.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../domain/entity/auth_type.dart';


class ForgotPasswordPopup extends StatelessWidget {
  const ForgotPasswordPopup._();

  static Future<void> show(BuildContext context) {
    return PopupHelper.show(
      context: context,
      popup: BlocProvider(
        create: (_) => sl<ForgotPasswordCubit>(),
        child: const ForgotPasswordPopup._(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) {
          return (current.isSuccess && !previous.isSuccess) ||
              (current.apiError != null &&
                  current.apiError != previous.apiError);
        },
      listener: (context, state) {
        if (state.isSuccess && state.successIdentifier != null) {
          Navigator.of(context).pop();
          VerifyOtpPopup.show(
            context,
            identifier: state.successIdentifier!,
            loginType: AuthType.email,
          );
        }

        if (state.apiError != null) {
          SnackBarHelper.showError(context, state.apiError!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ForgotPasswordCubit>();

        return CustomPopup.singleInputPopup(
          icon: Iconsax.security_safe4,
          title: "forgot_password".tr(),
          description: "forgot_password_title".tr(args: [state.email]),
          inputLabel: 'email_label'.tr(),
          inputHint: "enter_your_email".tr(),
          onInputChanged: cubit.onEmailChanged,
          errorText: state.emailError,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Iconsax.sms,
            color: context.colors.purple400,
            size: 20,
          ),
          enabled: !state.isLoading,
          primaryButtonText: "send_verification_code".tr(),
          isPrimaryButtonLoading: state.isLoading,
          isPrimaryButtonEnabled: !state.isLoading,
          primaryButtonOnPressed: cubit.submit,
        );
      },
    );
  }
}