// import 'package:fpdart/fpdart.dart';
// import '../failure/domain_failure.dart';
//
// enum RealtimeConnectionStatus {
//   disconnected,
//   connecting,
//   connected,
//   reconnecting,
//   failed,
// }
//
// class RealtimeEvent {
//   final String name;
//   final Map<String, dynamic> data;
//   const RealtimeEvent({required this.name, required this.data});
// }
//
// abstract interface class RealtimeService {
//   Stream<RealtimeConnectionStatus> get connectionStatus;
//   Stream<RealtimeEvent> get events;
//
//   Stream<Failure> get failures;
//
//   Future<Either<Failure, Unit>> connect({required int userId});
//
//   Future<void> disconnect();
//
//   Future<void> dispose();
// }