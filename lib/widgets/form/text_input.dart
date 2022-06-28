import 'package:apollo/shared/utils/string_utils.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:apollo/widgets/elements/tiny_text_field.dart';
import 'package:apollo/widgets/form/form.dart';
import 'package:flutter/material.dart';

enum TextInputTheme { tiny, rounded }

class TextInput extends StatelessWidget {
  final String name;
  final String label;
  final double labelFontSize;
  final bool autoFocus;
  final TextInputType type;
  final Function? validator;
  final String? equalTo;
  final String? equalToLabel;
  final Widget? child;
  final TextInputTheme theme;

  final TextEditingController controller = TextEditingController();

  static late BuildContext buildContext;

  TextInput(
      {Key? key,
      required this.label,
      required this.name,
      this.theme = TextInputTheme.tiny,
      this.validator,
      this.child,
      this.autoFocus = false,
      this.labelFontSize = 12,
      this.type = TextInputType.text,
      this.equalToLabel,
      this.equalTo})
      : super(key: key);

  dynamic composedValidator(String text) {
    CustomFormState? form = CustomForm.useForm(buildContext);
    if (equalTo != null) {
      if (form!.getFormValue(equalTo!) != text) {
        return 'O valor digitado não é igual ao campo ${equalToLabel ?? equalTo}';
      }
    } else {
      if (text.isEmpty) {
        return 'Campo obrigatório';
      } else {
        if (type == TextInputType.emailAddress) {
          if (!StringUtils.isEmail(text)) {
            return 'Por favor, informe um email válido';
          }
        } else {
          if (validator != null) {
            return validator!(text);
          }
        }
      }
    }
    return null;
  }

  void onChanged(String text) {
    CustomFormState? form = CustomForm.useForm(buildContext);
    if (form != null) {
      form.setFormValue(name, text);
    }
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    CustomFormState? form = CustomForm.useForm(context);
    if (form!.getFormValue(name) != null) {
      controller.text = form.getFormValue(name);
    }

    switch (theme) {
      case TextInputTheme.tiny:
        return TinyTextField(
          label: label,
          controller: controller,
          onChanged: onChanged,
          validator: composedValidator,
          autoFocus: autoFocus,
          child: child,
          type: type,
        );
      case TextInputTheme.rounded:
        return RoundedTextField(
          label: label,
          controller: controller,
          onChanged: onChanged,
          validator: composedValidator,
          labelFontSize: labelFontSize,
          autoFocus: autoFocus,
          type: type,
        );
    }
  }
}
