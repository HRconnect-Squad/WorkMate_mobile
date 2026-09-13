import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_input_field.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/components/popups/action_confirm_popup.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/design_system/theme/workmate_theme.dart';
import '../../logic/submit_leave_cubit.dart';
import '../../logic/submit_leave_state.dart';
import '../widget/leave_type_selection_sheet.dart';

class SubmitLeaveScreen extends StatelessWidget {
  const SubmitLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      appBar: CustomAppBar.simple(title: 'submit_leave'.tr(),
          showBackButton: true, onBackPressed: () => context.pop()),
      body: BlocConsumer<SubmitLeaveCubit, SubmitLeaveState>(
        listenWhen: (previous, current) =>
        (current.error != null && current.error != previous.error) || (current.isSuccess && !previous.isSuccess),
        listener: (context, state) {
          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
            context.read<SubmitLeaveCubit>().clearError();
          }
          if (state.isSuccess) {
            SnackBarHelper.showSuccess(context, 'leave_submitted_successfully'.tr());
            context.pop(true);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                child: _buildForm(context, state),
              ),
              Positioned(bottom: 0, left: 0, right: 0, child: _buildSubmitButton(context, state)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context, SubmitLeaveState state) {
    final cubit = context.read<SubmitLeaveCubit>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('fill_leave_information'.tr(),
              style: context.textTheme.titleMediumFont.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text('information_about_leave_details'.tr(),
              style: context.textTheme.bodySmallFont.copyWith(color: context.colors.textSecondary)),
          const SizedBox(height: 16),

          _label(context, 'leave_category'.tr()),
          const SizedBox(height: 6),
          _selector(
            context,
            icon: Iconsax.calendar_1,
            value: state.selectedLeaveType?.name,
            placeholder: 'select_category'.tr(),
            error: state.leaveTypeError,
            onTap: state.isLoading || state.isLoadingLeaveTypes
                ? null
                : () => LeaveTypeSelectionSheet.show(
              context,
              leaveTypes: state.leaveTypes,
              selectedType: state.selectedLeaveType,
              onSelected: cubit.onLeaveTypeChanged,
            ),
          ),
          if (state.leaveTypeError != null) _errorText(context, state.leaveTypeError!),
          const SizedBox(height: 16),

          _label(context, 'start_date'.tr()),
          const SizedBox(height: 6),
          _selector(
            context,
            icon: Iconsax.calendar,
            value: state.startDate != null ? DateFormat('dd MMM yyyy').format(state.startDate!) : null,
            placeholder: 'select_start_date'.tr(),
            error: state.dateError,
            onTap: state.isLoading ? null : () => _pickStartDate(context, cubit, state),
          ),
          const SizedBox(height: 16),

          _label(context, 'end_date'.tr()),
          const SizedBox(height: 6),
          _selector(
            context,
            icon: Iconsax.calendar,
            value: state.endDate != null ? DateFormat('dd MMM yyyy').format(state.endDate!) : null,
            placeholder: 'select_end_date'.tr(),
            error: null,
            onTap: (state.isLoading || state.startDate == null) ? null : () => _pickEndDate(context, cubit, state),
            disabled: state.startDate == null,
          ),
          if (state.dateError != null) _errorText(context, state.dateError!),
          const SizedBox(height: 16),

          _label(context, 'emergency_contact'.tr()),
          const SizedBox(height: 6),
          CustomInputField(
            initialValue: state.emergencyContact,
            hintKey: 'enter_emergency_contact'.tr(),
            keyboardType: TextInputType.phone,
            enabled: !state.isLoading,
            onChanged: cubit.onEmergencyContactChanged,
            radius: 12,
            contentPaddingHorizontal: 16,
            contentPaddingVertical: 14,
            filledColor: context.colors.white,
            enabledColor: context.colors.gray300,
            prefixIcon: Icon(Iconsax.call, size: 20, color: context.colors.purple400),
          ),
          const SizedBox(height: 16),

          _label(context, 'leave_description'.tr()),
          const SizedBox(height: 6),
          CustomInputField(
            initialValue: state.description,
            hintKey: 'enter_leave_description'.tr(),
            enabled: !state.isLoading,
            minLines: 4,
            maxLines: 6,
            onChanged: cubit.onDescriptionChanged,
            radius: 12,
            contentPaddingHorizontal: 16,
            contentPaddingVertical: 14,
            filledColor: context.colors.white,
            enabledColor: state.descriptionError != null ? context.colors.error : context.colors.gray300,
          ),
          if (state.descriptionError != null) _errorText(context, state.descriptionError!),
        ],
      ),
    );
  }

  Widget _selector(
      BuildContext context, {
        required IconData icon,
        required String? value,
        required String placeholder,
        required String? error,
        required VoidCallback? onTap,
        bool disabled = false,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: disabled ? 0.5 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: context.colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: error != null ? context.colors.error : context.colors.gray300),
          ),
          child: Row(
            children: [
              Icon(icon, size: 20, color: context.colors.purple400),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  value ?? placeholder,
                  style: context.textTheme.bodyMediumFont
                      .copyWith(color: value != null ? context.colors.textPrimary : context.colors.gray400),
                ),
              ),
              Icon(Icons.keyboard_arrow_down_rounded, color: context.colors.gray400),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(BuildContext context, String text) =>
      Text(text, style: context.textTheme.bodySmallFont.copyWith(color: context.colors.gray600, fontWeight: FontWeight.w500));

  Widget _errorText(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.only(top: 4),
    child: Text(text, style: context.textTheme.bodySmallFont.copyWith(color: context.colors.error)),
  );

  Widget _buildSubmitButton(BuildContext context, SubmitLeaveState state) {
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
          buttonText: 'submit_now'.tr(),
          isLoading: state.isLoading,
          isEnabled: !state.isLoading,
          onPressed: () => _onSubmitTap(context, state),
        ),
      ),
    );
  }

  // Mirrors the Expense flow: skip the confirmation popup when the form is
  // still invalid so validation errors surface immediately; only confirm
  // once the request is actually ready to send.
  void _onSubmitTap(BuildContext context, SubmitLeaveState state) {
    final isFormFilled = state.selectedLeaveType != null && state.hasDateRange && state.description.trim().isNotEmpty;

    if (!isFormFilled) {
      context.read<SubmitLeaveCubit>().submit();
      return;
    }

    ActionConfirmPopup.show(
      context,
      icon: Iconsax.calendar_1,
      title: 'ready_to_submit'.tr(),
      description: 'double_check_leave_details'.tr(),
      confirmText: 'yes_submit'.tr(),
      cancelText: 'no_let_me_check'.tr(),
      isLoading: state.isLoading,
      onConfirm: () {
        Navigator.of(context).pop();
        context.read<SubmitLeaveCubit>().submit();
      },
      onCancel: () => Navigator.of(context).pop(),
    );
  }

  Future<void> _pickStartDate(BuildContext context, SubmitLeaveCubit cubit, SubmitLeaveState state) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: state.startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => Theme(data: WorkMateTheme.light(), child: child!),
    );
    if (picked != null) cubit.onStartDateChanged(picked);
  }

  Future<void> _pickEndDate(BuildContext context, SubmitLeaveCubit cubit, SubmitLeaveState state) async {
    if (state.startDate == null) return;
    final picked = await showDatePicker(
      context: context,
      initialDate: state.endDate ?? state.startDate!,
      firstDate: state.startDate!,
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => Theme(data: WorkMateTheme.light(), child: child!),
    );
    if (picked != null) cubit.onEndDateChanged(picked);
  }
}