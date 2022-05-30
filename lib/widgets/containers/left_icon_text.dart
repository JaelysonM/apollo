import 'package:apollo/widgets/elements/touchable_opacity.dart';
import 'package:flutter/material.dart';

class LeftIconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final double fontSize;
  final TextStyle? style;
  final Function? onTap;
  const LeftIconText(
      {Key? key,
      required this.text,
      required this.icon,
      this.fontSize = 18,
      this.style,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
        onTap: () {
          onTap?.call();
        },
        child: Row(
          children: [
            Icon(icon, size: fontSize, color: Colors.white),
            const SizedBox(width: 20),
            Text(text,
                style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)
                    .merge(style)),
          ],
        ));
  }
}
