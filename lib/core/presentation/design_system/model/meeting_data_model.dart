import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/helper/time_extension.dart';

class MeetingDataModel {
  String meetingTitle;
  TimeOfDay startTime;
  TimeOfDay endTime;
  List<String?> userImages;

  final int? participantsCount;
  final String? joinLink;

  MeetingDataModel({
    required this.meetingTitle,
    required this.startTime,
    required this.endTime,
    required this.userImages,
    this.participantsCount,
    this.joinLink,
  });

  int get remainingParticipants =>
      max(0, (participantsCount ?? userImages.length) - userImages.length);

  String formatTime(BuildContext context) => "${startTime.formatTime(context)} - ${endTime.formatTime(context)}";
}
