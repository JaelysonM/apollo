import 'package:flutter/material.dart';

class MixedText extends StatelessWidget {
  final List<InlineSpan> content;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  const MixedText(this.content, {Key? key, this.size, this.color, this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: size ?? 15,
          color: color ?? Colors.white,
          fontWeight: weight,
        ),
        children: content,
      ),
    );
  }
}
