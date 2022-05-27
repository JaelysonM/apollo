import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class MixedText extends StatelessWidget {
  final List<InlineSpan> content;
  final double? size;
  final Color? color;
  const MixedText(this.content, {Key? key, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: size ?? 15,
          color: color ?? Colors.white,
        ),
        children: content,
      ),
    );
  }
}
