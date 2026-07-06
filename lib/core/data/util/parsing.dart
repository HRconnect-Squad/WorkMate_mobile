import 'package:intl/intl.dart';

class DataFormat{

  static DateTime? parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateFormat('yyyy-MM-dd').parse(dateString);
    } catch (e) {
      return null;
    }
  }

  static DateTime? parseDateTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return null;
    try {
      return DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTimeString);
    } catch (e) {
      return null;
    }
  }

  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}