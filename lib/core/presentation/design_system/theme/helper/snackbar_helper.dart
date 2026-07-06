import 'package:flutter/material.dart';
import 'package:workmate/core/presentation/design_system/theme/helper/theme_extention.dart';
import 'package:toastification/toastification.dart';

class SnackBarHelper {
  SnackBarHelper._();

  static void showError(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 3),
      }) {
    toastification.show(
      context: context,
      title: Text(
        message,
        style: TextStyle(
          color: context.colors.white,
        ),
      ),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: duration,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: false,
      dragToClose: true,
    );
  }

  static void showSuccess(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 3),
      }) {
    toastification.show(
      context: context,
      title: Text(
        message,
        style: TextStyle(
          color: context.colors.white,
        ),
      ),
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: duration,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: false,
      dragToClose: true,
    );
  }

  static void showInfo(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 3),
      }) {
    toastification.show(
      context: context,
      title: Text(
        message,
        style: TextStyle(
          color: context.colors.white,
        ),
      ),
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: duration,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: false,
      dragToClose: true,
    );
  }
}