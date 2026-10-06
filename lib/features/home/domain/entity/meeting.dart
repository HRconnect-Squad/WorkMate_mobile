import 'package:equatable/equatable.dart';

class MeetingParticipant extends Equatable {
  final int id;
  final String name;
  final String? avatarUrl;

  const MeetingParticipant({
    required this.id,
    required this.name,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [id, name, avatarUrl];
}

class Meeting extends Equatable {
  final int id;
  final String title;

  final DateTime startTime;
  final DateTime endTime;
  final String? joinLink;

  final List<MeetingParticipant> participants;
  final int participantsCount;

  const Meeting({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    this.joinLink,
    this.participants = const [],
    required this.participantsCount,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    startTime,
    endTime,
    joinLink,
    participants,
    participantsCount,
  ];
}
