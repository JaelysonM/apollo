import 'package:flutter/material.dart';

class DefaultBoldText extends StatelessWidget {
  final String content;
  final String? fontFamily;
  final double? fontSize;
  final Color? color;

  const DefaultBoldText(
      {Key? key,
      required this.content,
      this.fontSize = 18,
      this.fontFamily,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(content,
        style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
            color: color));
  }
}
