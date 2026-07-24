import 'package:flutter/material.dart';

import '../../../../../../core/presentation/design_system/components/custom_attendant_clockin.dart';
import '../../../../../../core/presentation/design_system/components/home_banner.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class ClockInPopup extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final String dateJoined;
  final String locationText;
  final String clockInTime;
  final String clockOutTime;

  const ClockInPopup({
    super.key,
    required this.userName,
    required this.userImageUrl,
    required this.dateJoined,
    required this.locationText,
    required this.clockInTime,
    required this.clockOutTime,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      elevation: 8,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: context.colors.gray50,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _HeaderCard(
            ),
            const SizedBox(height: 16),

            _ProfileCard(
              userName: userName,
              userImageUrl: userImageUrl,
              dateJoined: dateJoined,
              locationText: locationText,
            ),
            const SizedBox(height: 16),

            _ScheduleCards(
              clockInTime: clockInTime,
              clockOutTime: clockOutTime,
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();
  @override
  Widget build(BuildContext context) {
    return HomeBanner(
      title: "You are in the clock-in area!",
      subtitle:"Now you can press clock-in in this area",
      image: AppAssets.clockIn,
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final String dateJoined;
  final String locationText;

  const _ProfileCard({
    required this.userName,
    required this.userImageUrl,
    required this.dateJoined,
    required this.locationText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "MY PROFILE",
          style: context.textTheme.labelMediumFont.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        CustomAttendantClockIn(
          imageUrl: userImageUrl,
          title: userName,
          dateTitle: dateJoined,
          locationTitle: locationText,
        ),
      ],
    );
  }
}

class _ScheduleCards extends StatelessWidget {
  final String clockInTime;
  final String clockOutTime;

  const _ScheduleCards({
    required this.clockInTime,
    required this.clockOutTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SCHEDULE",
          style: context.textTheme.labelMediumFont.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _ScheduleCard(
                title: "CLOCK IN",
                time: clockInTime,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _ScheduleCard(
                title: "CLOCK OUT",
                time: clockOutTime,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  final String title;
  final String time;

  const _ScheduleCard({
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.gray200),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: context.textTheme.labelSmallFont.copyWith(
              color: context.colors.gray600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: context.textTheme.titleLargeFontSemiBold.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: context.colors.black,
            ),
          ),
        ],
      ),
    );
  }
}