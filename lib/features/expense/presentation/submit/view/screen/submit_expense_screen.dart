import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/config/app_constant.dart';
import '../../../../../../core/domain/service/image_picker_helper.dart';
import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/components/popups/action_confirm_popup.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/design_system/theme/workmate_theme.dart';
import '../../logic/submit_expense_cubit.dart';
import '../../logic/submit_expense_state.dart';
import '../widget/submit_expense_banner.dart';
import '../widget/submit_expense_form.dart';

class SubmitExpenseScreen extends StatelessWidget {
  const SubmitExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      appBar: CustomAppBar.simple(title: 'submit_expense'.tr(), showBackButton: true, onBackPressed: () => context.pop()),
      body: BlocConsumer<SubmitExpenseCubit, SubmitExpenseState>(
        listenWhen: (previous, current) =>
        (current.error != null && current.error != previous.error) ||
            (current.uploadReceiptError != null && current.uploadReceiptError != previous.uploadReceiptError) ||
            (current.isSuccess && !previous.isSuccess),
        listener: (context, state) {
          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
            context.read<SubmitExpenseCubit>().clearError();
          }
          if (state.uploadReceiptError != null) {
            SnackBarHelper.showError(context, state.uploadReceiptError!);
            context.read<SubmitExpenseCubit>().clearUploadReceiptError();
          }
          if (state.isSuccess) {
            SnackBarHelper.showSuccess(context, 'expense_submitted_successfully'.tr());
            context.pop(true);
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
                      onRemoveReceipt: () => context.read<SubmitExpenseCubit>().removeReceipt(),
                      selectedCategory: state.selectedCategory,
                      categoryError: state.categoryError,
                      onCategoryChanged: (category) => context.read<SubmitExpenseCubit>().onCategoryChanged(category),
                      selectedDate: state.selectedDate,
                      dateError: state.dateError,
                      onDateTap: () => _selectDate(context),
                      amount: state.amount,
                      amountError: state.amountError,
                      onAmountChanged: (value) => context.read<SubmitExpenseCubit>().onAmountChanged(value),
                      description: state.description,
                      onDescriptionChanged: (value) => context.read<SubmitExpenseCubit>().onDescriptionChanged(value),
                      isEnabled: !state.isSubmitting && !state.isUploadingReceipt,
                    ),
                  ],
                ),
              ),
              Positioned(bottom: 0, left: 0, right: 0, child: _buildSubmitButton(context, state)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, SubmitExpenseState state) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: context.colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, -4))],
      ),
      child: SafeArea(
        top: false,
        child: CustomPrimaryButton.gradient(
          height: 56,
          borderRadius: 28,
          buttonText: 'submit_expense'.tr(),
          isLoading: state.isSubmitting,
          isEnabled: !state.isSubmitting && !state.isUploadingReceipt,
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
        SnackBarHelper.showError(context, 'file_too_large'.tr(args: [AppConstant.maxImageSizeMB.toInt().toString()]));
      }
      return;
    }

    if (context.mounted) context.read<SubmitExpenseCubit>().uploadReceipt(file.path);
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 2),
      lastDate: now,
      builder: (context, child) => Theme(data: WorkMateTheme.light(), child: child!),
    );
    if (picked != null && context.mounted) context.read<SubmitExpenseCubit>().onDateChanged(picked);
  }

  void _onSubmitTap(BuildContext context, SubmitExpenseState state) {
    if (!state.isFormValid) {
      context.read<SubmitExpenseCubit>().submit();
      return;
    }

    ActionConfirmPopup.show(
      context,
      icon: Iconsax.receipt_edit,
      title: 'ready_to_submit'.tr(),
      description: 'double_check_expense_details'.tr(),
      confirmText: 'yes_submit'.tr(),
      cancelText: 'no_let_me_check'.tr(),
      isLoading: state.isSubmitting,
      onConfirm: () {
        Navigator.of(context).pop();
        context.read<SubmitExpenseCubit>().submit();
      },
      onCancel: () => Navigator.of(context).pop(),
    );
  }
}