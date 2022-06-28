import 'package:apollo/shared/utils/string_utils.dart';
import 'package:apollo/shared/utils/time_formatter.dart';
import 'package:flutter/material.dart';

enum FlowLayout {
  row,
  column,
}

class CurrentDateContainer extends StatelessWidget {
  final FlowLayout layout;
  final double fontSize;
  const CurrentDateContainer(
      {Key? key, this.layout = FlowLayout.column, this.fontSize = 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return layout == FlowLayout.column
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringUtils.capitalize(TimeFormatter.formatDateWithMonth(now)) +
                    ',',
                style: TextStyle(fontSize: fontSize, color: Colors.white),
                textAlign: TextAlign.left,
              ),
              Text(
                StringUtils.capitalize(TimeFormatter.findDayOfWeek(now)),
                style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ],
          )
        : Text(
            StringUtils.capitalize(TimeFormatter.formatDateWithMonth(now)) +
                ', ' +
                StringUtils.capitalize(TimeFormatter.findDayOfWeek(now)),
            style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          );
  }
}
