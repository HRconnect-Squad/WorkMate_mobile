import 'package:intl/intl.dart';

class DurationFormatUtils {
  const DurationFormatUtils._();

  static int hhmmssToSeconds(String? hhmmss) {
    if (hhmmss == null || hhmmss.isEmpty) return 0;
    final parts = hhmmss.split(':');
    if (parts.length < 3) return 0;
    final h = int.tryParse(parts[0]) ?? 0;
    final m = int.tryParse(parts[1]) ?? 0;
    final s = int.tryParse(parts[2]) ?? 0;
    return h * 3600 + m * 60 + s;
  }

  static String secondsToHHMMSS(int totalSeconds) {
    final safe = totalSeconds < 0 ? 0 : totalSeconds;
    final h = safe ~/ 3600;
    final m = (safe % 3600) ~/ 60;
    final s = safe % 60;
    return '${h.toString().padLeft(2, '0')}:'
        '${m.toString().padLeft(2, '0')}:'
        '${s.toString().padLeft(2, '0')}';
  }

  static String secondsToHHMM(int totalSeconds) {
    final safe = totalSeconds < 0 ? 0 : totalSeconds;
    final h = safe ~/ 3600;
    final m = (safe % 3600) ~/ 60;
    return '${h.toString().padLeft(2, '0')}:'
        '${m.toString().padLeft(2, '0')}';
  }

  static String hhmmssToHHMM(String? hhmmss) {
    if (hhmmss == null || hhmmss.isEmpty) return '00:00';
    final parts = hhmmss.split(':');
    if (parts.length < 2) return '00:00';
    return '${parts[0]}:${parts[1]}';
  }

  static double secondsToDecimalHours(int totalSeconds) =>
      totalSeconds / 3600;

  static DateTime combineWithToday(String hhmmss) {
    final parts = hhmmss.split(':');
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      int.tryParse(parts.elementAtOrNull(0) ?? '0') ?? 0,
      int.tryParse(parts.elementAtOrNull(1) ?? '0') ?? 0,
      int.tryParse(parts.elementAtOrNull(2) ?? '0') ?? 0,
    );
  }


  static String hhmmssToAmPm(String? hhmmss) {
    if (hhmmss == null || hhmmss.isEmpty) return '—';
    try {
      final dt = combineWithToday(hhmmss);
      return DateFormat('hh:mm a').format(dt);
    } catch (_) {
      return hhmmss;
    }
  }


  static String dateTimeStringToAmPm(String? raw) {
    if (raw == null || raw.isEmpty) return '—';
    try {
      final normalized = raw.contains('T') ? raw : raw.replaceFirst(' ', 'T');
      final dt = DateTime.parse(normalized);
      return DateFormat('hh:mm a').format(dt);
    } catch (_) {
      return raw;
    }
  }

  static String dateAndTimeToOverlayFormat(
    String? date,
    String? time, {
    String gmtOffset = '+07:00',
  }) {
    if (date == null || date.isEmpty || time == null || time.isEmpty) {
      return time ?? '—';
    }
    try {
      final dt = DateTime.parse('${date}T$time');
      return '${DateFormat('dd/MM/yy hh:mma').format(dt)} GMT $gmtOffset';
    } catch (_) {
      return time;
    }
  }
}
