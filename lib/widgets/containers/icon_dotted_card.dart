import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class IconDottedCard extends StatelessWidget {
  final IconData iconData;
  final Widget child;
  const IconDottedCard({Key? key, required this.iconData, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 54),
        child: DottedBorder(
          strokeWidth: 1,
          borderType: BorderType.RRect,
          radius: const Radius.circular(15),
          dashPattern: const [9],
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Row(
                children: [
                  Icon(iconData, color: Colors.white, size: 32),
                  const SizedBox(width: 10),
                  Expanded(child: child),
                ],
              )),
        ));
  }
}
