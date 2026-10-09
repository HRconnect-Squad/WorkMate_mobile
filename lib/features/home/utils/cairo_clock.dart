class CairoClock {
  CairoClock._();

  static DateTime now({DateTime? utcNow}) {
    final utc = (utcNow ?? DateTime.now()).toUtc();
    final offset = _isDst(utc) ? 3 : 2;
    return utc.add(Duration(hours: offset));
  }

  static String todayIso({DateTime? utcNow}) {
    final d = now(utcNow: utcNow);
    final mm = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    return '${d.year}-$mm-$dd';
  }

  static bool _isDst(DateTime utc) {
    final start = _lastWeekdayOfMonth(utc.year, DateTime.april, DateTime.friday)
        .subtract(const Duration(hours: 2));
    final end = _lastWeekdayOfMonth(utc.year, DateTime.october, DateTime.thursday)
        .add(const Duration(days: 1))
        .subtract(const Duration(hours: 3));
    return !utc.isBefore(start) && utc.isBefore(end);
  }

  static DateTime _lastWeekdayOfMonth(int year, int month, int weekday) {
    final last = DateTime.utc(year, month + 1, 0);
    return last.subtract(Duration(days: (last.weekday - weekday) % 7));
  }
}
