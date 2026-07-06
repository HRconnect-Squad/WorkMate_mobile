import 'package:flutter/material.dart';

class PopupHelper {
  PopupHelper._();

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget popup,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: popup,
      ),
    );
  }
}