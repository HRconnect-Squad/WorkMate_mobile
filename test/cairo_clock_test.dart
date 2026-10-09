import 'package:flutter_test/flutter_test.dart';
import 'package:workmate/features/home/utils/cairo_clock.dart';

void main() {
  test('Cairo date uses DST offset and rolls over the day', () {
    // Winter: UTC+2
    expect(CairoClock.todayIso(utcNow: DateTime.utc(2026, 1, 10, 22, 30)), '2026-01-11');
    expect(CairoClock.todayIso(utcNow: DateTime.utc(2026, 1, 10, 21, 59)), '2026-01-10');
    // Summer: UTC+3
    expect(CairoClock.todayIso(utcNow: DateTime.utc(2026, 7, 10, 21, 0)), '2026-07-11');
    // 2026-10-05 is still DST
    expect(CairoClock.todayIso(utcNow: DateTime.utc(2026, 10, 5, 21, 30)), '2026-10-06');
    // DST ends Thu 2026-10-29 24:00 local
    expect(CairoClock.now(utcNow: DateTime.utc(2026, 10, 29, 20, 59)).hour, 23);
    expect(CairoClock.now(utcNow: DateTime.utc(2026, 10, 29, 21, 0)).hour, 23);
  });
}
