import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../model/meeting_data_model.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';
import 'card_header.dart';
import 'custom_primary_button.dart';
import 'empty_state_card.dart';
import 'horizontal_stacked_avatars.dart';

class TodayMeeting extends StatelessWidget {
  final List<MeetingDataModel> meetings;
  const TodayMeeting({super.key, required this.meetings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.baseWhite,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            _buildHeader(context),
            if (meetings.isNotEmpty)
              ...meetings.map((meeting) => _buildMeetingCard(context, meeting)),
            if (meetings.isEmpty) _buildEmptyState(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return CardHeader(
      title: "today_meeting".tr(),
      subtitle: "meet_subtitle".tr(),
      count: meetings.isNotEmpty ? meetings.length.toString() : null,
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return EmptyStateCard(
      imgPath: AppAssets.noMeetings,
      imgtitle: "no_meetings".tr(),
      imgDescription: "no_meet_des".tr(),
    );
  }

  Widget _buildMeetingCard(BuildContext context, MeetingDataModel meeting) {
    String meetingTime = meeting.formatTime(context);

    return Container(
      constraints: const BoxConstraints(minHeight: 85),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.gray100,
        border: Border.all(color: context.colors.gray200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMeetingTitleRow(context, meeting, meetingTime),
          const SizedBox(height: 12),
          _buildMeetingBottomRow(context, meeting),
        ],
      ),
    );
  }

  Widget _buildMeetingTitleRow(
      BuildContext context, MeetingDataModel meeting, String meetingTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              _buildMeetingIcon(context),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  meeting.meetingTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: context.textTheme.titleSmallFont.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildMeetingTime(context, meetingTime),
      ],
    );
  }

  Widget _buildMeetingIcon(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: context.colors.purple500,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Iconsax.video5,
        size: 12,
        color: context.colors.pureWhite,
      ),
    );
  }

  Widget _buildMeetingTime(BuildContext context, String meetingTime) {
    return Row(
      children: [
        Icon(Iconsax.clock5, color: context.colors.gray300, size: 16),
        const SizedBox(width: 4),
        Text(
          meetingTime,
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildMeetingBottomRow(BuildContext context, MeetingDataModel meeting) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAvatarsRow(context, meeting),
        _buildJoinButton(context),
      ],
    );
  }

  Widget _buildAvatarsRow(BuildContext context, MeetingDataModel meeting) {
    return Row(
      children: [
        HorizontalStackedAvatars(commenterImage: meeting.userImages),
        if (meeting.userImages.length > 3) ...[
          const SizedBox(width: 4),
          Text(
            "+${meeting.userImages.length - 3}",
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildJoinButton(BuildContext context) {
    return CustomPrimaryButton.filled(
      width: 80,
      textStyle: context.textTheme.labelSmallFont.copyWith(
        color: context.colors.white,
      ),
      buttonText: "join_meet".tr(),
      backgroundColor: context.colors.purple500,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      borderRadius: 100,
      onPressed: () {},
    );
  }
}
