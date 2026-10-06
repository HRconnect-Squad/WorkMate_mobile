class MeetingParticipantDto {
  final int id;
  final String name;
  final String? avatarUrl;

  const MeetingParticipantDto({
    required this.id,
    required this.name,
    this.avatarUrl,
  });

  factory MeetingParticipantDto.fromJson(Map<String, dynamic> json) =>
      MeetingParticipantDto(
        id: json['id'] as int? ?? 0,
        name: (json['full_name'] ?? json['name']) as String? ?? '',
        avatarUrl: json['avatar_url'] as String?,
      );
}

class MeetingDto {
  final int id;
  final String title;
  final String startTime;
  final String endTime;
  final String? joinLink;
  final List<MeetingParticipantDto> participants;
  final int participantsCount;

  const MeetingDto({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    this.joinLink,
    this.participants = const [],
    required this.participantsCount,
  });

  factory MeetingDto.fromJson(Map<String, dynamic> json) {
    final participants = (json['participants'] as List<dynamic>? ?? [])
        .map((e) => MeetingParticipantDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return MeetingDto(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      joinLink: json['join_link'] as String?,
      participants: participants,
      participantsCount:
          json['participants_count'] as int? ?? participants.length,
    );
  }
}
