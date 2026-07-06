import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../theme/helper/theme_extention.dart';

class CustomAttendantHistory extends StatelessWidget {
  final String? attendanceDate, clockInOut, totalHours;

  const CustomAttendantHistory({
    super.key,
    this.attendanceDate,
    this.clockInOut,
    this.totalHours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: [
          Row(
            spacing: 4,
            children: [
              Icon(
                Iconsax.calendar_2,
                size: 16,
                color: context.colors.purple500,
              ),
              Text(
                attendanceDate ?? "attendancedate".tr(),
                style: context.textTheme.titleSmallFont.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: context.colors.gray200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "total_hours".tr(),
                      style: context.textTheme.labelMediumFont.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                    Text(
                      totalHours ?? "defaulttotalhours".tr(),
                      style: context.textTheme.titleMediumFont.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colors.textBody,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "clock_in_out".tr(),
                      style: context.textTheme.labelMediumFont.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                    Text(
                      clockInOut ?? "defaulttimerange".tr(),
                      style: context.textTheme.titleMediumFont.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colors.textBody,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
