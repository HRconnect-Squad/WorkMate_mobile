import 'package:equatable/equatable.dart';

class ClockInAttendance extends Equatable {
  final num latitude;
  final num longitude;
  final String? notes;
  final String proofImage;

  const ClockInAttendance({
    required this.latitude,
    required this.longitude,
    required this.notes,
    required this.proofImage,
  });

  @override
  List<Object?> get props => [
    latitude,
    longitude,
    notes,
    proofImage,
  ];
}
