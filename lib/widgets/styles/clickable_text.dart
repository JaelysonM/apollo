import 'package:apollo/widgets/elements/touchable_opacity.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ClickableText extends StatelessWidget {
  final String content;
  final VoidCallback? onTap;
  final double fontSize;
  final Color color;
  final TextStyle? style;

  const ClickableText(
      {Key? key,
      required this.content,
      this.onTap,
      this.fontSize = 14,
      this.color = kSystemPurple,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
        onTap: () => onTap?.call(),
        child: Text(
          content,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ).merge(style),
        ));
  }
}
