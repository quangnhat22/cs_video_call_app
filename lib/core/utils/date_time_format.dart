import 'package:intl/intl.dart';

class AppDateTimeFormat {
  AppDateTimeFormat._();

  static String formatDDMMYYYY(DateTime? date) {
    return date != null
        ? DateFormat('dd-MM-yyyy').format(date)
        : DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  static DateTime parseDDMMYYYY(String? string) {
    return string != null
        ? DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(string)
        : DateTime.now();
  }

  static String convertToHourMinuteFollowDay(DateTime time) {
    final checkToday = _calculateDifference(time);
    if (checkToday == 0) {
      return DateFormat.jm().format(time.toLocal());
    } else if (checkToday == -1) {
      return "Yesterday";
    }
    return DateFormat("dd/MM/yyyy").format(time.toLocal());
  }

  static int _calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  static String differentTime(DateTime startTime, DateTime endTime) {
    return '${endTime.difference(startTime).inMinutes}m';
  }
}
