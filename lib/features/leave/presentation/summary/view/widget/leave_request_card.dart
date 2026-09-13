import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/data/util/parsing.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/leave.dart';
import '../../../../domain/entity/leave_status.dart';
import '../../../helper/leave_status_extension.dart';

class LeaveRequestCard extends StatelessWidget {
  final Leave request;
  final VoidCallback? onCancel;

  const LeaveRequestCard({super.key, required this.request, this.onCancel});

  Color _statusColor(BuildContext context) => switch (request.status) {
    LeaveStatus.approved => context.colors.success500,
    LeaveStatus.rejected => context.colors.error,
    LeaveStatus.cancelled => context.colors.gray400,
    LeaveStatus.pending => context.colors.warning25,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Iconsax.calendar_1, size: 16, color: context.colors.purple500),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  DataFormat.formatDate(request.startDate),
                  style: context.textTheme.titleSmallFont.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: _statusColor(context).withOpacity(0.15), borderRadius: BorderRadius.circular(8)),
                child: Text(
                  request.status.toDisplayString(),
                  style: context.textTheme.labelSmallFont.copyWith(color: _statusColor(context), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(request.leaveType.name, style: context.textTheme.bodySmallFont.copyWith(color: context.colors.textSecondary)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _labelValue(context, 'leave_date'.tr(),
                  '${DataFormat.formatDate(request.startDate)} - ${DataFormat.formatDate(request.endDate)}'),
              _labelValue(context, 'total_leave'.tr(), '${request.totalDays} ${'days'.tr()}'),
            ],
          ),
          if (request.status == LeaveStatus.rejected && request.rejectionReason != null) ...[
            const SizedBox(height: 8),
            Text(
              request.rejectionReason!,
              style: context.textTheme.bodySmallFont.copyWith(color: context.colors.error),
            ),
          ],
          if (request.isCancellable && onCancel != null) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onCancel,
                child: Text('cancel_request'.tr(), style: TextStyle(color: context.colors.error)),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _labelValue(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.textTheme.labelSmallFont.copyWith(color: context.colors.textSecondary)),
        const SizedBox(height: 2),
        Text(value, style: context.textTheme.bodyMediumFont.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}