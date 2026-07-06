import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../domain/entity/employee_profile.dart';
import '../profile_container.dart';

class ProfileContactSection extends StatelessWidget {
  final EmployeeProfile profile;
  //final String? userIdentifier;


  const ProfileContactSection({
    super.key,
    required this.profile,
    //required this.userIdentifier,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileContainer(
      title: 'contact'.tr(),
      profileItems: [
        if (profile.emailAddress != null)
          ProfileItem.info(
            title: profile.emailAddress!,
            icon: Iconsax.sms,
          ),
        if (profile.phone != null)
        ProfileItem.info(
          title: profile.phone!,
          icon: Iconsax.mobile,
        ),
        ProfileItem.info(
          title: profile.address.isNotEmpty
              ? profile.address
              : 'no_address'.tr(),
          icon: Iconsax.location,
        ),
      ],
    );
  }
}