import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final double maxValue;
  const ProgressBar({Key? key, required this.value, required this.maxValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      child: Stack(
        children: [
          Container(
            width: value / maxValue * double.infinity,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
