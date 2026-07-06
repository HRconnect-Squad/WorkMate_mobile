import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/config/app_constant.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../auth/presentation/change_password/view/popup/change_password_popup.dart';
import '../../../../../domain/entity/employee_profile.dart';
import '../../../logic/profile_cubit.dart';
import '../profile_container.dart';

class ProfileSettingsSection extends StatelessWidget {
  final EmployeeProfile profile;
  final ProfileCubit cubit;


  const ProfileSettingsSection({
    super.key,
    required this.profile,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileContainer(
      title: 'settings'.tr(),
      profileItems: [
        ProfileItem.action(
          title: 'change_password'.tr(),
          icon: Iconsax.lock,
          onTap: () => ChangePasswordPopup.show(context),
        ),
        ProfileItem.action(
          title: 'versioning'.tr(),
          icon: Iconsax.info_circle,
          onTap: () => _showVersionDialog(context),
        ),
        ProfileItem.action(
          title: 'faq_help'.tr(),
          icon: Iconsax.message_question,
          onTap: () => {},
        ),
        ProfileItem.danger(
          title: 'logout'.tr(),
          icon: Iconsax.logout,
          onTap: () => _showLogoutDialog(context, cubit),
        ),
      ],
    );
  }
}

void _showVersionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text('app_version'.tr()),
      content: const Text(AppConstant.appVersion),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('ok'.tr()),
        ),
      ],
    ),
  );
}

void _showLogoutDialog(BuildContext context, ProfileCubit cubit) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text('logout'.tr()),
      content: Text('logout_confirmation'.tr()),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: Text('cancel'.tr()),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(dialogContext);
            cubit.logout();
          },
          child: Text(
            'logout'.tr(),
            style: TextStyle(color: context.colors.error),
          ),
        ),
      ],
    ),
  );
}

