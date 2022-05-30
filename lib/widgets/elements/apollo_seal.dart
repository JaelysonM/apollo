import 'package:apollo/constants/colors.dart';
import 'package:apollo/widgets/styles/default_bold_text.dart';
import 'package:flutter/material.dart';

class ApolloSeal extends StatelessWidget {
  final double fontSize;
  const ApolloSeal({Key? key, this.fontSize = 13}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.hourglass_top, size: fontSize * 1.4, color: kSystemPurple),
        const SizedBox(width: 5),
        DefaultBoldText(
          fontFamily: 'Red Hat Text',
          content: 'Selo Apollo',
          fontSize: fontSize,
        )
      ],
    );
  }
}
