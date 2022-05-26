import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class RoundedTextField extends StatelessWidget {
  final IconData? icon;
  final String label;
  final TextInputType type;
  final TextEditingController controller;
  final Function? validator;
  final Function onChanged;
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
          borderRadius: BorderRadius.circular(15),
        ),
        margin: margin,
        child: TextFormField(
          obscureText: type == TextInputType.visiblePassword,
          autofocus: autoFocus,
          controller: controller,
          autocorrect: autoCorrect,
          cursorColor: kLightGray,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black45,
            fontWeight: FontWeight.w500,
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
                color: kLightGray, fontSize: 18, fontWeight: FontWeight.w800),
            border: InputBorder.none,
          ),
          onChanged: (text) {
            onChanged(text);
          },
          validator: (text) => validator!(text),
        ));
  }
}
