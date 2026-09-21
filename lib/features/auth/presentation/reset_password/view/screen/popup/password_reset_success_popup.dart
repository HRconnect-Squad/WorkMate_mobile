import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../../core/presentation/routes/route_names.dart';


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
      title: 'password_reset_success_title'.tr(),
      description: 'password_reset_success_description'.tr(),
      primaryButtonText: 'continue'.tr(),
      primaryButtonOnPressed: () {
        Navigator.of(context).pop();
        context.go(RouteNames.homeScreen);
      },
    );
  }
}