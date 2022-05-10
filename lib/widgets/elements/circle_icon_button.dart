import 'package:apollo/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';

class CircleIconButton extends StatelessWidget {
  final dynamic icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final Color buttonColor;
  final double size;

  final String? imagePath;
  final ImageType? imageType;

  const CircleIconButton(
      {Key? key,
      this.icon,
      this.onPressed,
      this.iconColor = Colors.white,
      this.buttonColor = kSystemPurple,
      this.size = 30,
      this.imagePath,
      this.imageType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onPressed?.call(),
        child: icon != null
            ? Icon(icon, color: iconColor, size: size)
            : ImageUtils(
                    path: imagePath!,
                    size: size,
                    type: imageType ?? ImageType.Asset)
                .make(),
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: const CircleBorder(),
            padding: EdgeInsets.all(size * 0.25)));
  }
}
