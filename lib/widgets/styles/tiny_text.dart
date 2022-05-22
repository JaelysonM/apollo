import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TinyText extends StatelessWidget {
  final String content;
  final double? fontSize;

  const TinyText({Key? key, required this.content, this.fontSize = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: content,
        style: TextStyle(
          fontSize: fontSize,
          color: kLightGray,
        ),
      ),
    );
  }
}
