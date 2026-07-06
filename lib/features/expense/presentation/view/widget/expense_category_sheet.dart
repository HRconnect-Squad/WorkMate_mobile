import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../domain/entity/expense_category.dart';

class ExpenseCategorySheet {
  static Future<void> show(
      BuildContext context, {
        ExpenseCategory? selectedCategory,
        required ValueChanged<ExpenseCategory> onSelected,
      }) {
    ExpenseCategory? tempSelected = selectedCategory;

    return PopupHelper.show(
      context: context,
      popup: StatefulBuilder(
        builder: (context, setState) {
          return CustomPopup(
            showDragHandle: true,
            title: 'Expense Category',
            description: 'Select Expense Category',
            content: _CategoryListContent(
              selectedCategory: tempSelected,
              onCategoryTapped: (category) {
                setState(() => tempSelected = category);
              },
            ),
            primaryButtonText: 'Submit Date',
            primaryButtonOnPressed: () {
              if (tempSelected != null) {
                onSelected(tempSelected!);
              }
              Navigator.of(context).pop();
            },
            isPrimaryButtonEnabled: tempSelected != null,

            secondaryButtonText: 'Close Message',
            secondaryButtonOnPressed: () {
              Navigator.of(context).pop();
            },
            buttonsAxis: PopupButtonsAxis.row,
          );
        },
      ),
    );
  }
}

class _CategoryListContent extends StatelessWidget {
  final ExpenseCategory? selectedCategory;
  final ValueChanged<ExpenseCategory> onCategoryTapped;

  const _CategoryListContent({
    required this.selectedCategory,
    required this.onCategoryTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: ExpenseCategory.values.map(
            (category) {
          final isSelected = selectedCategory == category;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GestureDetector(
              onTap: () => onCategoryTapped(category),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colors.purple50
                      : context.colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? context.colors.purple500
                        : context.colors.gray200,
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Iconsax.category,
                      size: 18,
                      color: isSelected
                          ? context.colors.purple500
                          : context.colors.gray400,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        category.displayName,
                        style: context.textTheme.bodyMediumFont.copyWith(
                          color: isSelected
                              ? context.colors.purple500
                              : context.colors.textPrimary,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Icon(
                        Icons.check_circle_rounded,
                        size: 18,
                        color: context.colors.purple500,
                      )
                    else
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.colors.gray300,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}