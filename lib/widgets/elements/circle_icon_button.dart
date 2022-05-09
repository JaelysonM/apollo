import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color iconColor;
  final Color buttonColor;
  final double size;

  const CircleIconButton(
      {Key? key,
      required this.icon,
      this.onPressed,
      this.iconColor = Colors.white,
      this.buttonColor = kSystemPurple,
      this.size = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed?.call(),
        child: Icon(icon, color: iconColor, size: size),
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: CircleBorder(),
            padding: EdgeInsets.all(size * 0.25)));
  }
}
