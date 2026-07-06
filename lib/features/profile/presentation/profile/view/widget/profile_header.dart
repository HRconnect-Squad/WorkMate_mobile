import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/employee_profile.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final EmployeeProfile profile;

  const ProfileHeaderWidget({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                profile.fullName,
                style: context.textTheme.popupTitleFont.copyWith(
                  color: context.colors.textPrimary,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            if (profile.isActive)
              Icon(
                Icons.verified,
                color: context.colors.purple500,
                size: 24,
              ),
          ],
        ),

        const SizedBox(height: 4),

        Text(
          profile.formattedJobTitle,
          style: context.textTheme.popupBodyFont.copyWith(
            color: context.colors.purple500,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}