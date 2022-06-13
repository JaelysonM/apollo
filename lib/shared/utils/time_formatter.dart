import 'package:apollo/shared/constants/globals.dart';

class TimeFormatter {
  static String findMonth(DateTime date) {
    return MONTHS_ARRAY.elementAt(date.month - 1);
  }

  static String findDayOfWeek(DateTime date) {
    return DAYS_ARRAY.elementAt(date.weekday - 1);
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

  static String formatMinutes(int minutes) {
    int hours = (minutes / 60).floor();

    return hours > 0
        ? '$hours ${hours > 1 ? 'horas' : 'hora'}'
        : '$minutes min';
  }

  static String formatMinutesToHhMm(int minutes) {
    int hours = (minutes / 60).floor();
    int minutesLeft = minutes % 60;

    return hours > 0 ? '${hours}h ${minutesLeft}m' : '${minutesLeft}m';
  }
}
