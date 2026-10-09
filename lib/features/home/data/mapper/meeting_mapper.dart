import '../../domain/entity/meeting.dart';
import '../remote/dto/meeting_dto.dart';

class MeetingMapper {
  MeetingMapper._();

  static Meeting toDomain(MeetingDto dto) => Meeting(
    id: dto.id,
    title: dto.title,
    startTime: DateTime.parse(dto.startTime).toUtc(),
    endTime: DateTime.parse(dto.endTime).toUtc(),
    joinLink: dto.joinLink,
    participants: dto.participants
        .map((p) => MeetingParticipant(
              id: p.id,
              name: p.name,
              avatarUrl: p.avatarUrl,
            ))
        .toList(),
    participantsCount: dto.participantsCount,
  );
}
