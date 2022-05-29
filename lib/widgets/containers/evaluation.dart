import 'package:apollo/constants/colors.dart';
import 'package:flutter/material.dart';

class Evaluation extends StatelessWidget {
  final double fontSize;
  final double evaluation;
  const Evaluation({Key? key, this.fontSize = 8, required this.evaluation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$evaluation',
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontFamily: 'Red Hat Text',
          ),
        ),
        Icon(
          Icons.star,
          color: kEvaluationColor,
          size: fontSize,
        ),
      ],
    );
  }
}
