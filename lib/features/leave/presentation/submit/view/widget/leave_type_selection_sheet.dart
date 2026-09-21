import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/presentation/design_system/components/selectable_chip.dart';
import '../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';
import '../../../../domain/entity/leave_type.dart';

class LeaveTypeSelectionSheet {
  static Future<void> show(
      BuildContext context, {
        required List<LeaveType> leaveTypes,
        LeaveType? selectedType,
        required ValueChanged<LeaveType> onSelected,
      }) {
    LeaveType? tempSelected = selectedType;

    return PopupHelper.show(
      context: context,
      popup: StatefulBuilder(
        builder: (context, setState) {
          return CustomPopup(
            showDragHandle: true,
            title: 'leave_category'.tr(),
            description: 'select_leave_category'.tr(),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: leaveTypes.map((type) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SelectableCheckChip(
                    label: type.name,
                    isSelected: tempSelected?.id == type.id,
                    onTap: () => setState(() => tempSelected = type),
                  ),
                );
              }).toList(),
            ),
            primaryButtonText: 'submit_date'.tr(),
            primaryButtonOnPressed: () {
              if (tempSelected != null) onSelected(tempSelected!);
              Navigator.of(context).pop();
            },
            isPrimaryButtonEnabled: tempSelected != null,
            secondaryButtonText: 'close_message'.tr(),
            secondaryButtonOnPressed: () => Navigator.of(context).pop(),
            buttonsAxis: PopupButtonsAxis.row,
          );
        },
      ),
    );
  }
}