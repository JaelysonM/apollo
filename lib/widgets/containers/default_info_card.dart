import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class DefaultInfoCard extends StatelessWidget {
  final List<Widget> children;
  final double maxWidth;
  final Color backgroundColor;

  const DefaultInfoCard(
      {Key? key,
      this.backgroundColor = kInterDarkBlue,
      required this.children,
      this.maxWidth = 210})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children));
  }
}
