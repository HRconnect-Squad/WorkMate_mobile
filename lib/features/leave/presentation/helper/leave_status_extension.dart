import 'package:easy_localization/easy_localization.dart';

import '../../domain/entity/leave_status.dart';

extension LeaveStatusExtension on LeaveStatus {
  String toDisplayString() {
    switch (this) {
      case LeaveStatus.pending: return 'pending'.tr();
      case LeaveStatus.approved: return 'approved'.tr();
      case LeaveStatus.rejected: return 'rejected'.tr();
      case LeaveStatus.cancelled: return 'cancelled'.tr();
    }
  }
}