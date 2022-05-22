import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TinyTextField extends StatelessWidget {
  final String label;
  final TextInputType type;
  final TextEditingController controller;
  final Function? validator;
  final Function onChanged;
  final bool autoFocus;
  final bool autoCorrect;

  final Widget? child;

  const TinyTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.onChanged,
    this.autoFocus = false,
    this.autoCorrect = false,
    this.type = TextInputType.text,
    this.validator,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 5),
        Row(children: [
          Expanded(
            child: _buildTextField(),
          ),
          child ?? const SizedBox(),
        ])
      ],
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      obscureText: type == TextInputType.visiblePassword,
      autofocus: autoFocus,
      controller: controller,
      autocorrect: autoCorrect,
      cursorColor: kLightGray,
      style: const TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      onChanged: (text) {
        onChanged(text);
      },
      validator: (text) => validator!(text),
    );
  }
}
