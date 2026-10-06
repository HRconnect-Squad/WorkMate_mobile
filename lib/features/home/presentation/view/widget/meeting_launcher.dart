import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';

Future<void> openMeetingLink(BuildContext context, String? link) async {
  final uri = link == null ? null : Uri.tryParse(link);
  final opened = uri != null &&
      await launchUrl(uri, mode: LaunchMode.externalApplication)
          .catchError((_) => false);

  if (!opened && context.mounted) {
    SnackBarHelper.showError(context, 'could_not_open_link'.tr());
  }
}
