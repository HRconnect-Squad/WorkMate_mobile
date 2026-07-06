import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/config/app_constant.dart';
import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/design_system/theme/workmate_theme.dart';
import '../../../../../core/presentation/util/image_picker_helper.dart';
import '../../logic/expenses_cubit.dart';
import '../../logic/expenses_state.dart';
import '../widget/submit_confirm_popup.dart';
import '../widget/submit_expense_banner.dart';
import '../widget/submit_expense_form.dart';

class SubmitExpenseScreen extends StatelessWidget {
  const SubmitExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      appBar: CustomAppBar.simple(
        title: 'Submit Expense',
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: BlocConsumer<ExpensesCubit, ExpensesState>(
        listenWhen: (previous, current) =>
        (current.submitError != null &&
            current.submitError != previous.submitError) ||
            (current.uploadReceiptError != null &&
                current.uploadReceiptError !=
                    previous.uploadReceiptError) ||
            (current.isSubmitSuccess && !previous.isSubmitSuccess),
        listener: (context, state) {
          if (state.submitError != null) {
            SnackBarHelper.showError(context, state.submitError!);
            context.read<ExpensesCubit>().clearSubmitError();
          }

          if (state.uploadReceiptError != null) {
            SnackBarHelper.showError(
              context,
              state.uploadReceiptError!,
            );
            context.read<ExpensesCubit>().clearUploadReceiptError();
          }

          if (state.isSubmitSuccess) {
            SnackBarHelper.showSuccess(
              context,
              'Expense submitted successfully',
            );
            context.read<ExpensesCubit>().clearSubmitSuccess();
            context.pop();
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SubmitExpenseBanner(),
                    const SizedBox(height: 24),

                    SubmitExpenseForm(
                      receiptUrl: state.receiptUrl,
                      isUploadingReceipt: state.isUploadingReceipt,
                      uploadReceiptError: state.uploadReceiptError,
                      onPickReceipt: () => _pickReceipt(context),
                      onRemoveReceipt: () =>
                          context.read<ExpensesCubit>().removeReceipt(),

                      selectedCategory: state.selectedCategory,
                      categoryError: state.categoryError,
                      onCategoryChanged: (category) => context
                          .read<ExpensesCubit>()
                          .onCategoryChanged(category),

                      selectedDate: state.selectedDate,
                      dateError: state.dateError,
                      onDateTap: () => _selectDate(context),

                      amount: state.amount,
                      amountError: state.amountError,
                      onAmountChanged: (value) => context
                          .read<ExpensesCubit>()
                          .onAmountChanged(value),

                      description: state.description,
                      onDescriptionChanged: (value) => context
                          .read<ExpensesCubit>()
                          .onDescriptionChanged(value),

                      isEnabled:
                      !state.isSubmitting && !state.isUploadingReceipt,
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildSubmitButton(context, state),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSubmitButton(
      BuildContext context,
      ExpensesState state,
      ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: context.colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: CustomPrimaryButton.gradient(
          height: 56,
          borderRadius: 28,
          buttonText: 'Submit Expense',
          isLoading: state.isSubmitting,
          isEnabled: !state.isSubmitting && !state.isUploadingReceipt,
          textStyle: context.textTheme.labelLargeFont.copyWith(
            color: context.colors.white,
            fontWeight: FontWeight.w600,
          ),
          onPressed: () => _onSubmitTap(context, state),
        ),
      ),
    );
  }

  Future<void> _pickReceipt(BuildContext context) async {
    final file = await ImagePickerHelper.pickReceipt();

    if (file == null) return;

    if (!ImagePickerHelper.isFileSizeValid(file)) {
      if (context.mounted) {
        SnackBarHelper.showError(
          context,
          'File size must be less than ${AppConstant.maxImageSizeMB.toInt()}MB',
        );
      }
      return;
    }

    if (context.mounted) {
      context.read<ExpensesCubit>().uploadReceipt(file.path);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 2),
      lastDate: now,
      builder: (context, child) => Theme(
        data: WorkMateTheme.light(),
        child: child!,
      ),
    );

    if (picked != null && context.mounted) {
      context.read<ExpensesCubit>().onDateChanged(picked);
    }
  }

  void _onSubmitTap(BuildContext context, ExpensesState state) {
    if (!state.isFormValid) {
      context.read<ExpensesCubit>().submitExpense();
      return;
    }

    SubmitConfirmPopup.show(
      context,
      isLoading: state.isSubmitting,
      onConfirm: () {
        Navigator.of(context).pop();
        context.read<ExpensesCubit>().submitExpense();
      },
      onCancel: () => Navigator.of(context).pop(),
    );
  }
}