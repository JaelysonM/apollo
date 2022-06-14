import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final IconData? icon;
  final String label;
  final double labelFontSize;
  final FontWeight labelFontWeight;
  final TextInputType type;
  final TextEditingController controller;
  final Function? validator;
  final Function onChanged;
  final double borderRadius;
  final bool autoFocus;
  final bool autoCorrect;
  final EdgeInsetsGeometry? margin;

  const RoundedTextField(
      {Key? key,
      required this.label,
      required this.controller,
      required this.onChanged,
      this.autoFocus = false,
      this.autoCorrect = false,
      this.type = TextInputType.text,
      this.borderRadius = 15,
      this.labelFontSize = 18,
      this.labelFontWeight = FontWeight.w800,
      this.validator,
      this.icon,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTextField();
  }

  Widget _buildTextField() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        margin: margin,
        child: TextFormField(
          obscureText: type == TextInputType.visiblePassword,
          autofocus: autoFocus,
          controller: controller,
          autocorrect: autoCorrect,
          cursorColor: kLightGray,
          style: TextStyle(
            fontSize: labelFontSize,
            color: Colors.black45,
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            icon: icon != null
                ? Icon(
                    icon,
                    color: kLightGray,
                  )
                : null,
            hintText: label,
            hintStyle: TextStyle(
                color: kLightGray,
                fontSize: labelFontSize,
                fontWeight: labelFontWeight),
            border: InputBorder.none,
          ),
          onChanged: (text) {
            onChanged(text);
          },
          validator: (text) => validator!(text),
        ));
  }
}
