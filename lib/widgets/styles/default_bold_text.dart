import 'package:flutter/material.dart';

class DefaultBoldText extends StatelessWidget {
  final String content;
  final double? fontSize;

  const DefaultBoldText({Key? key, required this.content, this.fontSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(content,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white));
  }
}
