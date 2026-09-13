import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/presentation/design_system/components/empty_state_card.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../domain/entity/leave_status.dart';

class LeaveEmptyState extends StatelessWidget {
  final LeaveStatus status;
  const LeaveEmptyState({super.key, required this.status});

  String get _titleKey => switch (status) {
    LeaveStatus.pending => 'no_pending_leave_requests',
    LeaveStatus.approved => 'no_approved_leave_requests',
    LeaveStatus.rejected => 'no_rejected_leave_requests',
    LeaveStatus.cancelled => 'no_cancelled_leave_requests',
  };

  String get _descriptionKey => switch (status) {
    LeaveStatus.pending => 'no_leave_submitted_description',
    _ => 'leave_requests_appear_here_description',
  };

  @override
  Widget build(BuildContext context) {
    return EmptyStateCard(
      imgPath: AppAssets.emptyLeaveState,
      imgtitle: _titleKey.tr(),
      imgDescription: _descriptionKey.tr(),
    );
  }
}