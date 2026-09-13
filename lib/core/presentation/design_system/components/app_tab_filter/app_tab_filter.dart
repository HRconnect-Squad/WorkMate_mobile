import 'package:flutter/material.dart';

import '../../theme/helper/theme_extention.dart';
import 'app_tab_item.dart';

class AppTabFilter<T> extends StatelessWidget {
  final List<AppTabItem<T>> items;
  final T selectedValue;
  final ValueChanged<T> onChanged;

  const AppTabFilter({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: 38,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: context.colors.cardBackgroundSecondary,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          for (final item in items)
            Expanded(
              child: _TabItem(
                item: item,
                isSelected: item.value == selectedValue,
                onTap: () => onChanged(item.value),
              ),
            ),
        ],
      ),
    );
  }
}

class _TabItem<T> extends StatelessWidget {
  final AppTabItem<T> item;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.purple500
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.label,
              style: context.textTheme.labelSmallFont.copyWith(
                color: isSelected
                    ? context.colors.white
                    : context.colors.textSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),

            if (item.count != null && item.count! > 0) ...[
              const SizedBox(width: 4),
              _TabBadge(
                count: item.count!,
                isSelected: isSelected,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TabBadge extends StatelessWidget {
  final int count;
  final bool isSelected;

  const _TabBadge({
    required this.count,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isSelected
            ? context.colors.error500
            : context.colors.gray300,
        shape: BoxShape.circle,
      ),
      child: Text(
        count >= 10 ? '+9' : '$count',
        style: context.textTheme.labelSmallFont.copyWith(
          color: isSelected
              ? context.colors.white
              : context.colors.textSecondary,
          fontSize: 10,
        ),
      ),
    );
  }
}