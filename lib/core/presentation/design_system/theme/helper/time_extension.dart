import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

extension TimeOfDayExtension on TimeOfDay {
  String formatTime(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;

    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, hour, minute);

    return DateFormat('hh:mm a', locale).format(dateTime);
  }

  
}
