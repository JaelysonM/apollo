import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedCardTiny extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const DottedCardTiny({
    Key? key,
    required this.child,
    this.maxWidth = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: DottedBorder(
          child: Container(child: child, padding: const EdgeInsets.all(8)),
          strokeWidth: 0.5,
          borderType: BorderType.RRect,
          color: Colors.white,
          radius: const Radius.circular(20),
        ));
  }
}
