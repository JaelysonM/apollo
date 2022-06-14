import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/icon_dotted_card.dart';
import 'package:flutter/material.dart';

class NoResultsFound extends StatelessWidget {
  final IconData iconData;
  final double textSize;
  final String text;
  const NoResultsFound(
      {Key? key,
      required this.iconData,
      required this.text,
      this.textSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconDottedCard(
        iconData: iconData,
        child: Text(
          text,
          style: TextStyle(fontSize: textSize, color: kNotFoundTextGray),
        ));
  }
}
