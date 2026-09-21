import 'package:flutter/material.dart';
import 'package:workmate/core/presentation/design_system/theme/helper/theme_extention.dart';

class AttendanceStatItemData {
  final String label;
  final String value;
  const AttendanceStatItemData({required this.label, required this.value});
}

class AttendanceStatsSection extends StatelessWidget {
  final List<List<AttendanceStatItemData>> rows;

  const AttendanceStatsSection({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < rows.length; i++) ...[
          if (i != 0) const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int j = 0; j < rows[i].length; j++) ...[
                if (j == 0)
                  _StatItem(item: rows[i][j])
                else ...[
                  const Spacer(),
                  _StatItem(item: rows[i][j]),
                ],
              ],
            ],
          ),
        ],
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final AttendanceStatItemData item;
  const _StatItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.label,
          style: context.textTheme.labelMediumFont
              .copyWith(
            fontSize: 12,
            color: context.colors.textSecondary
          ),
        ),
        const SizedBox(height: 4),
        Text(
          item.value,
          style: context.textTheme.labelMediumFont.copyWith(
            fontSize: 16,
            color: context.colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
