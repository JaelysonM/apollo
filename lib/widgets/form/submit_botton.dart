import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/form/form.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const SubmitButton(
      {Key? key, required this.child, this.backgroundColor = kSystemPurple})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomFormState? form = CustomForm.useForm(context);

    return DefaultButton(
        child: child,
        onPressed: () {
          if (form != null) {
            form.submit();
          }
        });
  }
}
