import 'package:flutter/material.dart';

import '../../theme/helper/popup_helper.dart';
import 'custom_popup.dart';

class ActionConfirmPopup {
  static Future<void> show(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String description,
        required String confirmText,
        required String cancelText,
        required VoidCallback onConfirm,
        required VoidCallback onCancel,
        bool isLoading = false,
      }) {
    return PopupHelper.show(
      context: context,
      isDismissible: !isLoading,
      enableDrag: !isLoading,
      popup: CustomPopup.primary(
        icon: icon,
        title: title,
        description: description,
        primaryButtonText: confirmText,
        primaryButtonOnPressed: onConfirm,
        secondaryButtonText: cancelText,
        secondaryButtonOnPressed: onCancel,
        isPrimaryButtonLoading: isLoading,
        isPrimaryButtonEnabled: !isLoading,
      ),
    );
  }
}