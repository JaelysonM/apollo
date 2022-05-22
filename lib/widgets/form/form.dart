import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final String name;
  final Function? onSubmit;
  final Function? onError;
  final Function? onSuccess;
  final List<Widget> children;
  final bool editable;
  const CustomForm(
      {Key? key,
      required this.name,
      required this.children,
      this.editable = true,
      this.onSuccess,
      this.onError,
      this.onSubmit})
      : super(key: key);

  static CustomFormState? useForm(BuildContext? context, {bool root = false}) =>
      root
          ? context?.findRootAncestorStateOfType<CustomFormState>()
          : context?.findAncestorStateOfType<CustomFormState>();

  @override
  State<CustomForm> createState() => CustomFormState();
}

class CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> formValues;

  @override
  void initState() {
    formValues = <String, dynamic>{};
    super.initState();
  }

  // Get field value from key
  dynamic getFormValue(String key) {
    return formValues[key];
  }

  // Change form values method

  void setFormValue(String key, dynamic value) {
    setState(() {
      formValues[key] = value;
    });
  }

  // Validate form method
  bool validate() {
    final form = _formKey.currentState;
    return form!.validate();
  }

  // Submit form method
  void submit() {
    if (validate()) {
      widget.onSubmit?.call(formValues);
      Navigator.of(context).pop();
    } else {
      widget.onError?.call();
    }
  }

  void success() {
    widget.onSuccess?.call(formValues);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: widget.children),
    );
  }
}
