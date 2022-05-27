import 'package:apollo/constants/colors.dart';
import 'package:flutter/material.dart';

class IconLeftCard extends StatelessWidget {
  final Widget child;
  final Widget icon;
  final Color? backgroundColor;
  const IconLeftCard({
    Key? key,
    required this.child,
    required this.icon,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 20),
        constraints: const BoxConstraints(maxWidth: 150),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 10),
            Expanded(child: child),
          ],
        ));
  }
}
