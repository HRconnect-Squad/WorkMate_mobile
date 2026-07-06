import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../model/history_card_model.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

class HistoryCard extends StatelessWidget {
  final HistoryCardModel historyCardModel;

  const HistoryCard({super.key, required this.historyCardModel});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: historyCardModel.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                historyCardModel.headerIcon,
                color: historyCardModel.headerIconColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                DateFormat(
                  'd MMMM y',
                  context.locale.languageCode,
                ).format(historyCardModel.date),
                style: textTheme.titleSmallFont,
              ),
            ],
          ),

          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.gray100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colors.gray200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InfoColumn(item: historyCardModel.infoItems[0]),
                ),
                Spacer(),
                Expanded(
                  child: InfoColumn(item: historyCardModel.infoItems[1]),
                ),
              ],
            ),
          ),

          if (historyCardModel.statusCard != null &&
              historyCardModel.statusAddedByName != null &&
              historyCardModel.statusImage != null &&
              historyCardModel.dateAddedStatus != null) ...[
            const SizedBox(height: 12),
            historyStatusCard(
              context,
              historyCardModel.dateAddedStatus!,
              historyCardModel.statusCard!,
              historyCardModel.statusImage,
              historyCardModel.statusAddedByName!,
            ),
          ],
        ],
      ),
    );
  }
}

class InfoColumn extends StatelessWidget {
  final InfoItem item;

  const InfoColumn({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.label.tr(),
          style: textTheme.labelMediumFont.copyWith(
            color: colors.textSecondary,
          ),
          maxLines: 1,
          overflow: TextOverflow.visible,
        ),
        const SizedBox(height: 4),
        Text(
          item.value,
          style: textTheme.bodyLargeFont.copyWith(
            color: colors.textBody,
            fontWeight: FontWeight.w300,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

Widget historyStatusCard(
  BuildContext context,
  DateTime dateAddStatus,
  StatusCard cardStatus,
  String? profileImage,
  String userName,
) {
  final textTheme = context.textTheme;
  final color = context.colors;
  String formattedDate = DateFormat(
    'd MMM y',
    context.locale.languageCode,
  ).format(dateAddStatus);
  return Row(
    children: [
      Icon(
        Iconsax.tick_circle5,
        color: cardStatus == StatusCard.approved
            ? color.success500
            : color.error,
        size: 16,
      ),
      SizedBox(width: 12),
      Text(
        cardStatus == StatusCard.approved
            ? "approved".tr(args: [formattedDate])
            : "rejected".tr(args: [formattedDate]),
        style: cardStatus == StatusCard.approved
            ? textTheme.labelMediumFont.copyWith(color: color.success500)
            : textTheme.labelMediumFont.copyWith(color: color.error),
      ),
      Spacer(),
      Text(
        "by".tr(),
        style: textTheme.labelMediumFont.copyWith(color: color.textPrimary),
      ),
      CircleAvatar(
        backgroundImage: AssetImage(
          profileImage ?? AppAssets.profilePlaceholder,
        ),
        radius: 12,
      ),
      Text(
        " $userName ",
        style: textTheme.labelMediumFont.copyWith(color: color.textPrimary),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
