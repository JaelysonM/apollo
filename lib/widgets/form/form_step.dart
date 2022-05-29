import 'package:apollo/widgets/form/form_with_step.dart';
import 'package:flutter/material.dart';

abstract class FormStep extends StatefulWidget {
  const FormStep({Key? key}) : super(key: key);

  Widget build(BuildContext context, FormWithStepContentState? stepForm);

  @override
  State<FormStep> createState() => FormStepState();
}

class FormStepState extends State<FormStep> {
  FormWithStepContentState? stepForm;

  @override
  Widget build(BuildContext context) {
    stepForm = FormWithStepContent.useFormWithStep(context);
    return widget.build(context, stepForm);
  }
}
