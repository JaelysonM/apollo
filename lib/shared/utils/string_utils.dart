import 'package:intl/intl.dart';

class StringUtils {
  static String zeroLeft(int number) {
    return number < 10 ? '0$number' : number.toString();
  }

  static String capitalize(String string) {
    return string.substring(0, 1).toUpperCase() + string.substring(1);
  }

  static String capitalizeAllWords(String string) {
    return string.split(' ').map((word) => capitalize(word)).join(' ');
  }

  static String formatDouble(double number) {
    return number.toStringAsFixed(1);
  }

  static String formatToNumber(double number) {
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    return oCcy.format(number);
  }

  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }
}
