import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../../core/presentation/routes/route_names.dart';
import '../../../../../domain/entity/employee_profile.dart';
import '../../../logic/profile_cubit.dart';
import '../profile_container.dart';

class ProfileAccountSection extends StatelessWidget {
  final EmployeeProfile profile;

  const ProfileAccountSection({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileContainer(
      title: 'account'.tr(),
      profileItems: [
        ProfileItem.action(title: profile.employeeCode, icon: Iconsax.clipboard,
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: profile.employeeCode));
              SnackBarHelper.showSuccess(context, 'employee_code_copied'.tr());
            },
        showArrow: false),
        ProfileItem.action(
          title: 'personal_data'.tr(),
          icon: Iconsax.user,
          onTap: () => _navigateToPersonalData(context),
        ),
        ProfileItem.action(
          title: 'office_assets'.tr(),
          icon: Iconsax.briefcase,
          onTap: () => context.push(RouteNames.officeAssets),
        ),
        ProfileItem.action(
          title: 'payroll_tax'.tr(),
          icon: Iconsax.wallet_3,
          onTap: () => context.push(RouteNames.payrollHistory),
        ),
      ],
    );
  }

  void _navigateToPersonalData(BuildContext context) async {
    final result = await context.push<bool>(RouteNames.personalData);

    if (result == true && context.mounted) {
      context.read<ProfileCubit>().refreshProfile();
    }
  }
}