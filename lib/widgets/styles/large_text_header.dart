import 'package:flutter/material.dart';

class LargeTextHeader extends StatelessWidget {
  final String content;
  final double? fontSize;

  const LargeTextHeader({Key? key, required this.content, this.fontSize = 30})
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
