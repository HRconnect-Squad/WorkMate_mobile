import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/components/header_banner.dart';
import '../../../../../../core/presentation/design_system/components/summary_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/extention_colors.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../logic/attendance_screen_cubit.dart';
import '../../logic/attendance_screen_state.dart';

class ClockInBanner extends StatelessWidget {
  final AttendanceScreenCubit attendanceScreenCubit;
  final AttendanceScreenState attendanceScreenState;

  final VoidCallback onClockInPressed;
  final VoidCallback onClockOutPressed;
  final VoidCallback onBreakPressed;
  final VoidCallback onBackToWorkPressed;

  const ClockInBanner({
    super.key,
    required this.attendanceScreenCubit,
    required this.attendanceScreenState,
    required this.onClockInPressed,
    required this.onClockOutPressed,
    required this.onBreakPressed,
    required this.onBackToWorkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          HeaderBanner(
            title: "Let's Clock-In!".tr(),
            subtitle: "Don't miss your clock in schedule".tr(),
            image: AppAssets.clockIn,
          ),

          Positioned(
            top: 95,
            left: 12,
            right: 12,
            child: SummaryCard(
              backgroundColor: context.colors.white,
              title: "Total Working Hour".tr(),
              subtitle: "Paid Period 1 Sept 2024 - 30 Sept 2024".tr(),
              items: [
                StateItemModel(
                  label: "Today".tr(),
                  value: "${attendanceScreenState.todayWorkingHours} Hrs",
                  icon: Icon(
                    Iconsax.clock5,
                    color: context.colors.gray300,
                    size: 16,
                  ),
                ),

                StateItemModel(
                  label: "This Pay Period".tr(),
                  value: "${attendanceScreenState.payPeriodWorkingHours} Hrs",
                  icon: Icon(
                    Iconsax.clock5,
                    color: context.colors.gray300,
                    size: 16,
                  ),
                ),
              ],

              buttons: _buildButtons(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildButtons(BuildContext context) {
    switch (attendanceScreenState.attendanceStatus) {

      case AttendanceStatus.notClockedIn:
        return [
          CustomPrimaryButton.gradient(
            height: 48,
            textStyle: context.textTheme.labelLargeFont.copyWith(
              color: context.colors.white,
            ),
            gradient: LinearGradient(
              colors: [
                ExtensionColors.purpleGradient0,
                ExtensionColors.purpleGradient1,
                ExtensionColors.purpleGradient2,
              ],
            ),
            borderRadius: 100,
            buttonText: "Clock In Now".tr(),
            onPressed: onClockInPressed,
          ),
        ];

      case AttendanceStatus.clockedIn:
        return [
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomPrimaryButton.outlined(
                  height: 48,
                  borderColor:context.colors.purple500,
                  textStyle: context.textTheme.labelLargeFont.copyWith(
                    color:context.colors.purple500,
                  ),
                  buttonText: "Take A Break".tr(),
                  onPressed: onBreakPressed,
                ),
              ),
              Expanded(
                child: CustomPrimaryButton.gradient(
                  height: 48,
                  textStyle: context.textTheme.labelLargeFont.copyWith(
                    color: context.colors.white,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      ExtensionColors.blackGradient0,
                      ExtensionColors.blackGradient1,
                    ]
                  ),
                  borderRadius: 100,
                  buttonText: "Clock Out".tr(),
                  onPressed: onClockOutPressed,
                ),
              ),
            ],
          ),
        ];

      case AttendanceStatus.onBreak:
        return [
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomPrimaryButton.gradient(
                  height: 48,
                  textStyle: context.textTheme.labelLargeFont.copyWith(
                    color: context.colors.white,
                  ),
                  gradient: LinearGradient(
                      colors: [
                    ExtensionColors.purpleGradient0,
                    ExtensionColors.purpleGradient1,
                    ExtensionColors.purpleGradient2,
                  ]),
                  borderRadius: 100,
                  buttonText: "Back To Work".tr(),
                  onPressed: onBackToWorkPressed,
                ),
              ),
              Expanded(
                child: CustomPrimaryButton.gradient(
                  height: 48,
                  textStyle: context.textTheme.labelLargeFont.copyWith(
                    color: context.colors.white,
                  ),
                  gradient: LinearGradient(
                      colors: [
                    ExtensionColors.blackGradient0,
                    ExtensionColors.blackGradient1,
                  ]),
                  borderRadius: 100,
                  buttonText: "Clock Out".tr(),
                  onPressed: onClockOutPressed,
                ),
              ),
            ],
          ),
        ];

      case AttendanceStatus.clockedOut:
        return [
          CustomPrimaryButton.gradient(
            height: 48,
            textStyle: context.textTheme.labelLargeFont.copyWith(
              color: context.colors.white,
            ),
            gradient: LinearGradient(
                colors: [
              ExtensionColors.purpleGradient0,
              ExtensionColors.purpleGradient1,
              ExtensionColors.purpleGradient2,
            ]),
            borderRadius: 100,
            isEnabled: false,
            buttonText: "clocked Out".tr(),
            onPressed: onClockOutPressed,
          ),
        ];
    }
  }
}