import 'package:apollo/widgets/elements/default_dropdown.dart';
import 'package:apollo/widgets/form/form.dart';
import 'package:flutter/material.dart';

class DropdownInput extends StatelessWidget {
  final String name;
  final String? label;
  final List<String> items;
  final Function(String value) displayComposer;
  static late BuildContext buildContext;

  const DropdownInput({
    Key? key,
    required this.label,
    required this.name,
    required this.items,
    required this.displayComposer,
  }) : super(key: key);

  void onChanged(String value) {
    CustomFormState? form = CustomForm.useForm(buildContext);
    if (form != null) {
      form.setFormValue(name, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    CustomFormState? form = CustomForm.useForm(context);
    String value = items.first;
    if (form!.getFormValue(name) != null) {
      value = form.getFormValue(name);
    }

    return DefaultDropdown(
      value: value,
      label: label,
      onChanged: onChanged,
      items: items,
      displayComposer: displayComposer,
    );
  }
}
