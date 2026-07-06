import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/components/popups/custom_popup.dart';
import '../../../../../../core/presentation/design_system/theme/helper/popup_helper.dart';

class SubmitConfirmPopup {
  static Future<void> show(
      BuildContext context, {
        required VoidCallback onConfirm,
        required VoidCallback onCancel,
        bool isLoading = false,
      }) {
    return PopupHelper.show(
      context: context,
      isDismissible: !isLoading,
      enableDrag: !isLoading,
      popup: CustomPopup.primary(
        icon: Iconsax.receipt_edit,
        title: 'Ready to Submit?',
        description:
        'Double-check your expense details to ensure everything is correct. Do you want to proceed?',
        primaryButtonText: 'Yes, Submit',
        primaryButtonOnPressed: onConfirm,
        secondaryButtonText: 'No, Let me check',
        secondaryButtonOnPressed: onCancel,
        isPrimaryButtonLoading: isLoading,
        isPrimaryButtonEnabled: !isLoading,
      ),
    );
  }
}