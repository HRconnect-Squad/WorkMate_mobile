import 'package:intl/intl.dart';

String formatDate(String? date) {
  if (date == null || date.isEmpty) return '';

  final parsedDate = DateTime.parse(date).toLocal();
  return DateFormat('d MMM').format(parsedDate);
}