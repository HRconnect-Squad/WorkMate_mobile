import 'dart:async';

class AttendanceNotifier {
  final _controller = StreamController<void>.broadcast();

  Stream<void> get onClockInSuccess => _controller.stream;

  void notifyClockInSuccess() => _controller.add(null);

  void dispose() => _controller.close();
}
