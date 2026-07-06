import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/components/custom_primary_button.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/payroll.dart';
import '../../logic/payroll_cubit.dart';
import '../../logic/payroll_state.dart';
import '../widget/payroll_details_card.dart';
import '../widget/working_hours_card.dart';

class PayrollDetailsScreen extends StatelessWidget {
  final Payroll payroll;

  const PayrollDetailsScreen({
    super.key,
    required this.payroll,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: CustomAppBar.simple(
        title: 'payroll_and_tax'.tr(),
        showBackButton: true,
        leadingBackgroundColor: context.colors.purple100,
        onBackPressed: () => context.pop(),
      ),
      body: BlocConsumer<PayrollCubit, PayrollState>(
        listenWhen: (previous, current) {
          return (current.error != null && current.error != previous.error) ||
              (current.exportSuccess != null && current.exportSuccess != previous.exportSuccess);
        },
        listener: (context, state) {
          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
            context.read<PayrollCubit>().clearError();
          }

          if (state.exportSuccess != null) {
            SnackBarHelper.showSuccess(context, state.exportSuccess!);
            context.read<PayrollCubit>().clearExportSuccess();
          }
        },
        builder: (context, state) {
          if (state.selectedPayroll == null) {
            return _buildErrorState(context);
          }

          final payroll = state.selectedPayroll!;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      WorkingHoursCard(payroll: payroll),
                      const SizedBox(height: 16),
                      PayrollDetailsCard(payroll: payroll),
                    ],
                  ),
                ),
              ),

              // Save as PDF Button
              _buildSaveAsPdfButton(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: context.colors.error,
            ),
            const SizedBox(height: 16),
            Text(
              'failed_to_load_payroll'.tr(),
              style: context.textTheme.bodyLargeFont.copyWith(
                color: context.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: () => context.read<PayrollCubit>().selectPayroll(payroll),
              icon: const Icon(Icons.refresh),
              label: Text('retry'.tr()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveAsPdfButton(BuildContext context, PayrollState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.white,
        boxShadow: [
          BoxShadow(
            color: context.colors.gray200,
            blurRadius: 8,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: CustomPrimaryButton.gradient(
          buttonText: 'save_as_pdf'.tr(),
          isLoading: state.isExportingPdf,
          isEnabled: !state.isExportingPdf,
          onPressed: () => context.read<PayrollCubit>().exportAsPdf(),
        ),
      ),
    );
  }
}