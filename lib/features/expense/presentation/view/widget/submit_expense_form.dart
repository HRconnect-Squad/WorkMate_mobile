import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/config/app_constant.dart';
import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../domain/entity/expense_category.dart';
import 'expense_category_sheet.dart';
import 'receipt_upload_widget.dart';

class SubmitExpenseForm extends StatelessWidget {
  final String? receiptUrl;
  final bool isUploadingReceipt;
  final String? uploadReceiptError;
  final VoidCallback onPickReceipt;
  final VoidCallback onRemoveReceipt;

  final ExpenseCategory? selectedCategory;
  final String? categoryError;
  final ValueChanged<ExpenseCategory> onCategoryChanged;

  final DateTime? selectedDate;
  final String? dateError;
  final VoidCallback onDateTap;

  final String amount;
  final String? amountError;
  final ValueChanged<String> onAmountChanged;

  final String description;
  final ValueChanged<String> onDescriptionChanged;

  final bool isEnabled;

  const SubmitExpenseForm({
    super.key,
    this.receiptUrl,
    this.isUploadingReceipt = false,
    this.uploadReceiptError,
    required this.onPickReceipt,
    required this.onRemoveReceipt,
    this.selectedCategory,
    this.categoryError,
    required this.onCategoryChanged,
    this.selectedDate,
    this.dateError,
    required this.onDateTap,
    this.amount = '',
    this.amountError,
    required this.onAmountChanged,
    this.description = '',
    required this.onDescriptionChanged,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fill Claim Information',
          style: context.textTheme.titleMediumFont.copyWith(
            color: context.colors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Information about claim details',
          style: context.textTheme.bodySmallFont.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 16),

        ReceiptUploadWidget(
          receiptUrl: receiptUrl,
          isUploading: isUploadingReceipt,
          errorMessage: uploadReceiptError,
          onPickFile: onPickReceipt,
          onRemoveFile: onRemoveReceipt,
        ),
        const SizedBox(height: 16),

        _buildLabel(context, 'Expense Category'),
        const SizedBox(height: 6),
        _buildCategorySelector(context),
        if (categoryError != null) ...[
          const SizedBox(height: 4),
          _buildErrorText(context, categoryError!),
        ],
        const SizedBox(height: 16),

        _buildLabel(context, 'Transaction Date'),
        const SizedBox(height: 6),
        _buildDateSelector(context),
        if (dateError != null) ...[
          const SizedBox(height: 4),
          _buildErrorText(context, dateError!),
        ],
        const SizedBox(height: 16),

        _buildLabel(
          context,
          'Expense Amount (${AppConstant.defaultCurrency})',
        ),
        const SizedBox(height: 6),
        CustomInputField(
          initialValue: amount,
          hintKey: 'Enter Amount',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          enabled: isEnabled,
          onChanged: onAmountChanged,
          radius: 12,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 16,
          filledColor: context.colors.white,
          enabledColor: amountError != null
              ? context.colors.error
              : context.colors.gray300,
          borderColor: amountError != null
              ? context.colors.error
              : context.colors.gray300,
          prefixIcon: Icon(
            Iconsax.dollar_square,
            size: 20,
            color: context.colors.purple400,
          ),
        ),
        if (amountError != null) ...[
          const SizedBox(height: 4),
          _buildErrorText(context, amountError!),
        ],
        const SizedBox(height: 16),

        _buildLabel(context, 'Expense Description'),
        const SizedBox(height: 6),
        CustomInputField(
          initialValue: description,
          hintKey: 'Enter Expense Description',
          enabled: isEnabled,
          minLines: 4,
          maxLines: 6,
          onChanged: onDescriptionChanged,
          radius: 12,
          contentPaddingHorizontal: 16,
          contentPaddingVertical: 16,
          filledColor: context.colors.white,
          enabledColor: context.colors.gray300,
        ),
      ],
    );
  }

  Widget _buildCategorySelector(BuildContext context) {
    final hasCategory = selectedCategory != null;

    return GestureDetector(
      onTap: isEnabled
          ? () => ExpenseCategorySheet.show(
        context,
        selectedCategory: selectedCategory,
        onSelected: onCategoryChanged,
      )
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: categoryError != null
                ? context.colors.error
                : context.colors.gray300,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Iconsax.category,
              size: 20,
              color: context.colors.purple400,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                hasCategory
                    ? selectedCategory!.displayName
                    : 'Select Category',
                style: context.textTheme.bodyMediumFont.copyWith(
                  color: hasCategory
                      ? context.colors.textPrimary
                      : context.colors.gray400,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: context.colors.gray400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    final hasDate = selectedDate != null;
    final formattedDate = hasDate
        ? DateFormat('dd MMMM yyyy').format(selectedDate!)
        : null;

    return GestureDetector(
      onTap: isEnabled ? onDateTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: dateError != null
                ? context.colors.error
                : context.colors.gray300,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Iconsax.calendar,
              size: 20,
              color: context.colors.purple400,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                formattedDate ?? 'Enter Transaction Date',
                style: context.textTheme.bodyMediumFont.copyWith(
                  color: hasDate
                      ? context.colors.textPrimary
                      : context.colors.gray400,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: context.colors.gray400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String label) {
    return Text(
      label,
      style: context.textTheme.bodySmallFont.copyWith(
        color: context.colors.gray600,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildErrorText(BuildContext context, String error) {
    return Text(
      error,
      style: context.textTheme.bodySmallFont.copyWith(
        color: context.colors.error,
      ),
    );
  }
}