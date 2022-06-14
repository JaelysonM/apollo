import 'package:apollo/shared/utils/time_formatter.dart';
import 'package:flutter/material.dart';

class MeanTime extends StatelessWidget {
  final double fontSize;
  final int meanTime;
  const MeanTime({Key? key, this.fontSize = 8, required this.meanTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.more_time,
          color: Colors.white,
          size: fontSize,
        ),
        Text(
          '~${TimeFormatter.formatMinutes(meanTime)}',
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontFamily: 'Red Hat Text'),
        ),
      ],
    );
  }
}
