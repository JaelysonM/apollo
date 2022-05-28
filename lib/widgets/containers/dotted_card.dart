import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedCard extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final double maxHeight;
  const DottedCard(
      {Key? key, required this.child, this.maxWidth = 100, this.maxHeight = 48})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: maxWidth),
        child: DottedBorder(
          child: Container(
              alignment: Alignment.center,
              child: child,
              padding: const EdgeInsets.all(8)),
          strokeWidth: 0.5,
          borderType: BorderType.RRect,
          color: Colors.white,
          radius: const Radius.circular(20),
        ));
  }
}
