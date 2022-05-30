import 'package:flutter/material.dart';

class SmallSectionTitle extends StatelessWidget {
  final String content;
  final double fontSize;
  const SmallSectionTitle(this.content, {Key? key, this.fontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 19),
        child: Text(
          content,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
