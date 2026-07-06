import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';


class PasswordResetSuccessPopup extends StatelessWidget {
  const PasswordResetSuccessPopup._();

  static Future<void> show(BuildContext context) {
    return PopupHelper.show(
      context: context,
      isDismissible: false,
      enableDrag: false,
      popup: const PasswordResetSuccessPopup._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopup.singleActionPopup(
      icon: Iconsax.security_safe4,
      title: 'Password Has Been Created',
      description: 'To log in to your account, click the Sign in button and enter your email along with your new password.',
      primaryButtonText: 'Sign In',
      primaryButtonOnPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}