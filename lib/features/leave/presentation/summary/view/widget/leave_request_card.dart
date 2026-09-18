import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/data/util/parsing.dart';
import '../../../../../../core/presentation/design_system/components/history_card.dart';
import '../../../../../../core/presentation/design_system/model/history_card_model.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../domain/entity/leave.dart';
import '../../../../domain/entity/leave_status.dart';

class LeaveHistoryCard extends StatelessWidget {
  final Leave request;
  final VoidCallback? onCancel;

  const LeaveHistoryCard({super.key, required this.request, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: HistoryCard(
        historyCardModel: HistoryCardModel(
          id: request.id.toString(),
          date: request.startDate,
          headerIcon: Iconsax.calendar_1,
          headerIconColor: context.colors.purple500,
          infoItems: [
            InfoItem(
              label: 'leave_date'.tr(),
              value: '${DataFormat.formatDate(request.startDate)} - ${DataFormat.formatDate(request.endDate)}',
            ),
            InfoItem(label: 'total_leave'.tr(), value: '${request.totalDays} ${'days'.tr()}'),
          ],
          statusCard: switch (request.status) {
            LeaveStatus.approved => StatusCard.approved,
            LeaveStatus.rejected => StatusCard.rejected,
            LeaveStatus.pending || LeaveStatus.cancelled => null,
          },
          // TODO: populate once the API returns approver identity
          dateAddedStatus: null,
          statusAddedByName: null,
          additionalNote: request.status == LeaveStatus.rejected ? request.rejectionReason : null,
          actions: request.isCancellable && onCancel != null
              ? [HistoryCardAction(label: 'cancel_request'.tr(), icon: Iconsax.close_circle, color: context.colors.error, onTap: onCancel!)]
              : const [],
        ),
      ),
    );
  }
}