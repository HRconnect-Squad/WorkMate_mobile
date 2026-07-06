import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/payroll.dart';

class PayrollDetailsCard extends StatelessWidget {
  final Payroll payroll;

  const PayrollDetailsCard({
    super.key,
    required this.payroll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.colors.gray200.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'payroll_details'.tr(),
            style: context.textTheme.titleMediumFont.copyWith(
              color: context.colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'details_about_payroll'.tr(),
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),

          _buildPayrollRow(
            context,
            label: 'basic_salary'.tr(),
            value: payroll.formattedBasicSalary,
          ),
          const SizedBox(height: 12),

          _buildPayrollRow(
            context,
            label: 'tax'.tr(),
            value: '-\$${(payroll.tax ?? payroll.deductions).toStringAsFixed(2)}',
            valueColor: context.colors.error,
          ),
          const SizedBox(height: 12),

          if (payroll.allowances != null && payroll.allowances! > 0) ...[
            _buildPayrollRow(
              context,
              label: 'reimbursement'.tr(),
              value: '+\$${payroll.allowances!.toStringAsFixed(2)}',
              valueColor: context.colors.success25,
            ),
            const SizedBox(height: 12),
          ],

          if (payroll.bonuses != null && payroll.bonuses! > 0) ...[
            _buildPayrollRow(
              context,
              label: 'bonus'.tr(),
              value: '+\$${payroll.bonuses!.toStringAsFixed(2)}',
              valueColor: context.colors.success25,
            ),
            const SizedBox(height: 12),
          ],

          _buildPayrollRow(
            context,
            label: 'overtime'.tr(),
            value: payroll.formattedOvertimePay,
          ),

          const SizedBox(height: 12),
          Divider(color: context.colors.gray200),
          const SizedBox(height: 12),

          _buildPayrollRow(
            context,
            label: 'total_salary'.tr(),
            value: payroll.formattedNetSalary,
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPayrollRow(
      BuildContext context, {
        required String label,
        required String value,
        Color? valueColor,
        bool isTotal = false,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? context.textTheme.titleSmallFont.copyWith(
            color: context.colors.textPrimary,
            fontWeight: FontWeight.w600,
          )
              : context.textTheme.bodyMediumFont.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        Text(
          value,
          style: isTotal
              ? context.textTheme.titleMediumFont.copyWith(
            color: context.colors.purple600,
            fontWeight: FontWeight.bold,
          )
              : context.textTheme.bodyMediumFont.copyWith(
            color: valueColor ?? context.colors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}