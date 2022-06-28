import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final Color color;

  const ProgressBar(
      {Key? key, required this.value, this.color = kProgressBarColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kProgressBarBackground,
      ),
      child: Stack(
        children: [
          Container(
            width: width * value,
            height: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
