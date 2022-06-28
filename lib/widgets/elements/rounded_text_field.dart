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
  final Function? onChanged;
  final double borderRadius;
  final bool autoFocus;
  final bool autoCorrect;
  final EdgeInsetsGeometry? margin;

  const RoundedTextField(
      {Key? key,
      required this.label,
      required this.controller,
      this.onChanged,
      this.autoFocus = false,
      this.autoCorrect = false,
      this.type = TextInputType.text,
      this.borderRadius = 15,
      this.labelFontSize = 15,
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.white,
              labelText: label,
              labelStyle: TextStyle(
                  color: kLightGray,
                  fontSize: labelFontSize,
                  fontWeight: labelFontWeight),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              errorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      color: kLightGray,
                    )
                  : null),
          onChanged: (text) {
            if (onChanged != null) {
              onChanged!(text);
            }
          },
          validator: (text) => validator!(text),
        ));
  }
}
