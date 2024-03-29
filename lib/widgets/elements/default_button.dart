import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const DefaultButton(
      {Key? key,
      required this.child,
      this.onPressed,
      this.backgroundColor = kSystemPurple})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed?.call(),
        child: child,
        style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10)));
  }
}
