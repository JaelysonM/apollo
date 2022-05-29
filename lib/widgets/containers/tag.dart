import 'package:flutter/widgets.dart';

class Tag extends StatelessWidget {
  final Color backgroundColor;
  final String content;
  final TextStyle? style;
  final double borderRadius;
  const Tag(
      {Key? key,
      required this.backgroundColor,
      required this.content,
      this.style,
      this.borderRadius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Align(
            alignment: Alignment.center, child: Text(content, style: style)),
      ),
    );
  }
}
