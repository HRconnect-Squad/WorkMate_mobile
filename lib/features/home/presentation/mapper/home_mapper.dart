import 'package:flutter/material.dart';
import '../../../../core/presentation/design_system/model/meeting_data_model.dart';
import '../../domain/entity/meeting.dart';

class HomeMapper {
  HomeMapper._();

  static MeetingDataModel toMeetingModel(Meeting meeting) => MeetingDataModel(
    meetingTitle: meeting.title,
    startTime: TimeOfDay.fromDateTime(meeting.startTime.toLocal()),
    endTime: TimeOfDay.fromDateTime(meeting.endTime.toLocal()),
    userImages: meeting.participants.map((p) => p.avatarUrl).toList(),
    participantsCount: meeting.participantsCount,
    joinLink: meeting.joinLink,
  );
}
