import 'package:apollo/shared/utils/string_utils.dart';
import 'package:apollo/shared/utils/time_formatter.dart';
import 'package:flutter/material.dart';

class CurrentDateContainer extends StatelessWidget {
  const CurrentDateContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringUtils.capitalize(TimeFormatter.formatDateWithMonth(now)) + ',',
          style: const TextStyle(fontSize: 25, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          StringUtils.capitalize(TimeFormatter.findDayOfWeek(now)),
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
