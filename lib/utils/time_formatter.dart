import '../constants/globals.dart';

class TimeFormatter {
  static String findMonth(DateTime date) {
    return MONTHS_ARRAY.elementAt(date.month - 1);
  }

  static String findDayOfWeek(DateTime date) {
    return DAYS_ARRAY.elementAt(date.weekday);
  }

  static String formatDateWithMonth(DateTime date) {
    return '${date.day} de ${findMonth(date)}';
  }

  static String formatDateWithMonthAndYear(DateTime date) {
    return '${date.day} de ${findMonth(date)} de ${date.year}';
  }

  static String formatCompleteDate(DateTime date) {
    return '${findDayOfWeek(date)},${formatDateWithMonthAndYear(date)}';
  }
}
