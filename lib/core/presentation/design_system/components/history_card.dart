import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../model/history_card_model.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

class HistoryCard extends StatelessWidget {
  final HistoryCardModel historyCardModel;
  final VoidCallback? onTap;

  const HistoryCard({super.key, required this.historyCardModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: historyCardModel.backgroundColor ?? colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(historyCardModel.headerIcon, color: historyCardModel.headerIconColor ?? colors.purple500, size: 20),
                const SizedBox(width: 8),
                Text(
                  DateFormat('d MMMM y', context.locale.languageCode).format(historyCardModel.date),
                  style: textTheme.titleSmallFont,
                ),
                const Spacer(),
                if (historyCardModel.actions.isNotEmpty) _KebabMenu(actions: historyCardModel.actions),
              ],
            ),
            const SizedBox(height: 12),
            _infoRow(context),
            if (historyCardModel.statusCard != null &&
                historyCardModel.dateAddedStatus != null &&
                historyCardModel.statusAddedByName != null) ...[
              const SizedBox(height: 12),
              _statusRow(context),
            ],
            if (historyCardModel.additionalNote != null && historyCardModel.additionalNote!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                historyCardModel.additionalNote!,
                style: textTheme.labelMediumFont.copyWith(color: colors.error),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _infoRow(BuildContext context) {
    final colors = context.colors;
    return Container(
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
          Expanded(child: _InfoColumn(item: historyCardModel.infoItems[0])),
          const Spacer(),
          Expanded(child: _InfoColumn(item: historyCardModel.infoItems[1])),
        ],
      ),
    );
  }

  Widget _statusRow(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    final isApproved = historyCardModel.statusCard == StatusCard.approved;
    final formattedDate = DateFormat('d MMM y', context.locale.languageCode).format(historyCardModel.dateAddedStatus!);

    return Row(
      children: [
        Icon(Iconsax.tick_circle5, color: isApproved ? colors.success500 : colors.error, size: 16),
        const SizedBox(width: 12),
        Text(
          isApproved ? 'approved'.tr(args: [formattedDate]) : 'rejected'.tr(args: [formattedDate]),
          style: textTheme.labelMediumFont.copyWith(color: isApproved ? colors.success500 : colors.error),
        ),
        const Spacer(),
        Text('by'.tr(), style: textTheme.labelMediumFont.copyWith(color: colors.textPrimary)),
        const SizedBox(width: 6),
        CircleAvatar(
          backgroundImage: AssetImage(historyCardModel.statusImage ?? AppAssets.profilePlaceholder),
          radius: 12,
        ),
        const SizedBox(width: 4),
        Text(historyCardModel.statusAddedByName!, style: textTheme.labelMediumFont.copyWith(color: colors.textPrimary)),
      ],
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final InfoItem item;
  const _InfoColumn({required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.label, style: textTheme.labelMediumFont.copyWith(color: colors.gray500)),
        const SizedBox(height: 4),
        Text(item.value, style: textTheme.bodyLargeFont.copyWith(color: colors.textBody)),
      ],
    );
  }
}

class _KebabMenu extends StatelessWidget {
  final List<HistoryCardAction> actions;
  const _KebabMenu({required this.actions});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(Icons.more_vert_rounded, color: context.colors.gray500, size: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      onSelected: (index) => actions[index].onTap(),
      itemBuilder: (context) => List.generate(actions.length, (index) {
        final action = actions[index];
        final color = action.color ?? context.colors.textPrimary;
        return PopupMenuItem(
          value: index,
          child: Row(
            children: [
              Icon(action.icon, size: 18, color: color),
              const SizedBox(width: 10),
              Text(action.label, style: context.textTheme.bodyMediumFont.copyWith(color: color)),
            ],
          ),
        );
      }),
    );
  }
}
