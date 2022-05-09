import 'package:flutter/material.dart';

import '../styles/large_text_header.dart';
import '../styles/tiny_text.dart';

class DefaultApproachHeader extends StatelessWidget {
  final String title;
  final String description;
  final double? titleFontSize;
  final double? descriptionFontSize;
  final Widget? child;

  const DefaultApproachHeader(
      {Key? key,
      required this.title,
      required this.description,
      this.titleFontSize,
      this.descriptionFontSize,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LargeTextHeader(
          content: title,
          fontSize: titleFontSize ?? 30,
        ),
        const SizedBox(height: 4),
        TinyText(
          content: description,
          fontSize: descriptionFontSize ?? 15,
        ),
      ],
    );
  }
}
