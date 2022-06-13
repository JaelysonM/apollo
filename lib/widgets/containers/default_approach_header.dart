import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';

import '../styles/large_text_header.dart';
import '../styles/tiny_text.dart';

class DefaultApproachHeader extends StatelessWidget {
  final String title;
  final dynamic description;
  final double? titleFontSize;
  final double? descriptionFontSize;
  final Widget? child;
  final double spacer;

  const DefaultApproachHeader(
      {Key? key,
      required this.title,
      this.description,
      this.titleFontSize,
      this.descriptionFontSize,
      this.child,
      this.spacer = 4})
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
        SizedBox(height: spacer),
        description is String
            ? TinyText(
                content: description,
                fontSize: descriptionFontSize ?? 15,
              )
            : RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: descriptionFontSize ?? 15,
                    color: kLightGray,
                  ),
                  children: description,
                ),
              ),
      ],
    );
  }
}
