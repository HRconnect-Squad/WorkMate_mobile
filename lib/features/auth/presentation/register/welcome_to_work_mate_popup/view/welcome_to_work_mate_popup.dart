import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/presentation/routes/route_names.dart';

class WelcomeToWorkMatePopUp extends StatelessWidget {
  const WelcomeToWorkMatePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      icon: Iconsax.user_octagon,
      title: 'welcome_to_workmate'.tr(),
      description: 'welcome_popup_description'.tr(),
      primaryButtonText: 'setup_my_profile'.tr(),
      primaryButtonOnPressed: () {
        Navigator.of(context).pop();
        context.go(RouteNames.profile);
      },
      secondaryButtonText: 'explore_app_first'.tr(),
      secondaryButtonOnPressed: () {
        Navigator.of(context).pop();
        context.go(RouteNames.homeScreen);
      },
    );
  }
}
