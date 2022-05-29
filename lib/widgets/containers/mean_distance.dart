import 'package:apollo/utils/string_utils.dart';
import 'package:flutter/material.dart';

class MeanDistance extends StatelessWidget {
  final double fontSize;
  final double distance;

  const MeanDistance({Key? key, required this.fontSize, required this.distance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          color: Colors.white,
          size: fontSize,
        ),
        Text(
          '~${StringUtils.formatDouble(distance)} km',
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontFamily: 'Red Hat Text'),
        ),
      ],
    );
  }
}
