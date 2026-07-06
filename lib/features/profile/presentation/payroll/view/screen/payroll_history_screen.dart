import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/presentation/design_system/components/app_bar.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../../../domain/entity/payroll.dart';
import '../../logic/payroll_cubit.dart';
import '../../logic/payroll_state.dart';
import '../widget/payroll_month_card.dart';

class PayrollHistoryScreen extends StatelessWidget {
  const PayrollHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: CustomAppBar.simple(
        title: 'payroll_and_tax'.tr(),
        leadingBackgroundColor: context.colors.purple100,
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: BlocConsumer<PayrollCubit, PayrollState>(
        listenWhen: (previous, current) {
          return current.error != null && current.error != previous.error;
        },
        listener: (context, state) {
          if (state.error != null) {
            SnackBarHelper.showError(context, state.error!);
            context.read<PayrollCubit>().clearError();
          }
        },
        builder: (context, state) {
          if (state.isLoadingHistory) {
            return _buildLoadingState(context);
          }

          if (!state.hasPayrollData && !state.isLoadingHistory) {
            return _buildEmptyState(context);
          }

          return RefreshIndicator(
            onRefresh: () => context.read<PayrollCubit>().refreshHistory(),
            color: context.colors.purple500,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.payrollHistory.length,
              itemBuilder: (context, index) {
                final payroll = state.payrollHistory[index];
                return PayrollMonthCard(
                  payroll: payroll,
                  onTap: () => _navigateToDetails(context, payroll),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.colors.purple500,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 80,
              color: context.colors.gray400,
            ),
            const SizedBox(height: 16),
            Text(
              'no_payroll_data'.tr(),
              style: context.textTheme.titleMediumFont.copyWith(
                color: context.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'no_payroll_data_description'.tr(),
              style: context.textTheme.bodyMediumFont.copyWith(
                color: context.colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: () => context.read<PayrollCubit>().loadPayrollHistory(),
              icon: const Icon(Icons.refresh),
              label: Text('retry'.tr()),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetails(BuildContext context, Payroll payroll) {
    context.push(
      RouteNames.payrollDetails,
      extra: payroll,
    );
  }
}