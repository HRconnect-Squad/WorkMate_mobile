import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/helper/app_assets.dart';
import '../theme/helper/theme_extention.dart';

enum ExpenseCardStatus {
  pending,
  approved,
  rejected;

  bool get isPending => this == ExpenseCardStatus.pending;
  bool get isApproved => this == ExpenseCardStatus.approved;
  bool get isRejected => this == ExpenseCardStatus.rejected;
}

enum _ExpenseMenuAction { delete }


class ExpenseHistoryCard extends StatelessWidget {
  final ExpenseCardStatus status;
  final String type;
  final double totalExpense;
  final DateTime date;
  final String? approvedByName;
  final String? approvedByImage;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const ExpenseHistoryCard({
    super.key,
    required this.status,
    required this.type,
    required this.totalExpense,
    required this.date,
    this.approvedByName,
    this.approvedByImage,
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.receipt_2,
                  color: context.colors.purple500,
                ),
                const SizedBox(width: 6),
                Text(
                  DateFormat(
                    'd MMMM y',
                    context.locale.languageCode,
                  ).format(date),
                  style: textTheme.titleSmallFont,
                ),
                const Spacer(),

                if (status.isPending && onDelete != null)
                  _KebabMenu(onDelete: onDelete!),
              ],
            ),

            const SizedBox(height: 12),

            _expenseCardInfo(context),

            if (!status.isPending) ...[
              const SizedBox(height: 8),
              _expenseStatus(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _expenseCardInfo(BuildContext context) {
    final textTheme = context.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: context.colors.gray100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colors.gray200),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'type'.tr(),
                style: textTheme.labelMediumFont.copyWith(
                  color: context.colors.gray500,
                ),
              ),
              Text(
                type,
                style: textTheme.bodyLargeFont.copyWith(
                  color: context.colors.textBody,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'total_expense'.tr(),
                style: textTheme.labelMediumFont.copyWith(
                  color: context.colors.gray500,
                ),
              ),
              Text(
                '\$$totalExpense',
                style: textTheme.bodyLargeFont.copyWith(
                  color: context.colors.textBody,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _expenseStatus(BuildContext context) {
    final txtTheme = context.textTheme;
    final color = context.colors;

    final String formattedDate = DateFormat(
      'd MMM y',
      context.locale.languageCode,
    ).format(date);

    final bool isApproved = status.isApproved;

    return Row(
      children: [
        Icon(
          Iconsax.tick_circle5,
          color: isApproved ? color.success500 : color.error,
          size: 16,
        ),
        const SizedBox(width: 12),
        Text(
          isApproved
              ? 'approved'.tr(args: [formattedDate])
              : 'rejected'.tr(args: [formattedDate]),
          style: txtTheme.labelMediumFont.copyWith(
            color: isApproved ? color.success500 : color.error,
          ),
        ),
        const Spacer(),
        if (approvedByName != null) ...[
          Text(
            'by'.tr(),
            style: txtTheme.labelMediumFont.copyWith(
              color: color.textPrimary,
            ),
          ),
          const SizedBox(width: 6),
          CircleAvatar(
            backgroundImage: AssetImage(
              approvedByImage ?? AppAssets.profilePlaceholder,
            ),
            radius: 12,
          ),
          const SizedBox(width: 4),
          Text(
            approvedByName!,
            style: txtTheme.labelMediumFont.copyWith(
              color: color.textPrimary,
            ),
          ),
        ],
      ],
    );
  }
}

class _KebabMenu extends StatelessWidget {
  final VoidCallback onDelete;

  const _KebabMenu({required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_ExpenseMenuAction>(
      icon: Icon(
        Icons.more_vert_rounded,
        color: context.colors.gray500,
        size: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      onSelected: (action) {
        if (action == _ExpenseMenuAction.delete) {
          onDelete();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: _ExpenseMenuAction.delete,
          child: Row(
            children: [
              Icon(
                Iconsax.trash,
                size: 18,
                color: context.colors.error,
              ),
              const SizedBox(width: 10),
              Text(
                'delete'.tr(),
                style: context.textTheme.bodyMediumFont.copyWith(
                  color: context.colors.error,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}