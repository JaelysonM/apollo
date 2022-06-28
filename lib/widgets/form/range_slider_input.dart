import 'package:apollo/widgets/elements/default_range_slider.dart';
import 'package:apollo/widgets/form/form.dart';
import 'package:flutter/material.dart';

class RangeSliderInput extends StatelessWidget {
  final String name;
  final String label;
  final double max;
  final double min;
  final int? divisions;

  static late BuildContext buildContext;

  const RangeSliderInput({
    Key? key,
    required this.label,
    required this.name,
    required this.max,
    required this.min,
    this.divisions,
  }) : super(key: key);

  void onChanged(List<double> value) {
    CustomFormState? form = CustomForm.useForm(buildContext);
    if (form != null) {
      form.setFormValue(name, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    CustomFormState? form = CustomForm.useForm(context);
    List<dynamic> value = [min, max];
    if (form!.getFormValue(name) != null) {
      value = form.getFormValue(name);
    }

    return DefaultRangeSlider(
      value: value,
      max: max,
      min: min,
      divisions: divisions,
      onChanged: onChanged,
      label: label,
    );
  }
}
