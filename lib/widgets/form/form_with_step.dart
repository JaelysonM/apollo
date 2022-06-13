import 'package:apollo/widgets/form/form.dart';
import 'package:apollo/widgets/form/form_step.dart';
import 'package:flutter/material.dart';

class FormWithStep extends StatelessWidget {
  final String name;
  final List<FormStep> steps;

  final Function? onSubmit;

  final bool editable;

  const FormWithStep({
    Key? key,
    required this.name,
    required this.steps,
    this.onSubmit,
    this.editable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      name: name,
      onSubmit: onSubmit,
      editable: editable,
      children: [FormWithStepContent(formWithStep: this)],
    );
  }
}

class FormWithStepContent extends StatefulWidget {
  final FormWithStep formWithStep;
  const FormWithStepContent({Key? key, required this.formWithStep})
      : super(key: key);

  List<FormStep> getSteps() => formWithStep.steps;

  static FormWithStepContentState? useFormWithStep(BuildContext context,
          {bool root = false}) =>
      root
          ? context.findRootAncestorStateOfType<FormWithStepContentState>()
          : context.findAncestorStateOfType<FormWithStepContentState>();

  @override
  State<FormWithStepContent> createState() => FormWithStepContentState();
}

class FormWithStepContentState extends State<FormWithStepContent> {
  late FormStep _step;
  late List<FormStep> _stepHistory;

  static late BuildContext buildContext;

  void next() {
    List<FormStep> steps = widget.getSteps();
    int stepIndex = _stepHistory.indexOf(_step);
    CustomFormState? form = CustomForm.useForm(buildContext);

    if (form!.validate()) {
      if (stepIndex < steps.length - 1) {
        setState(() {
          _step = steps[stepIndex + 1];
          _stepHistory.add(_step);
        });
      } else {
        form.submit();
      }
    }
  }

  void clean() {
    setState(() {
      _stepHistory.clear();
    });
  }

  void pop() {
    setState(() {
      _stepHistory.removeLast();
      _step = _stepHistory.last;
    });
  }

  @override
  void initState() {
    List<FormStep> steps = widget.getSteps();
    _stepHistory = [];
    if (steps.isNotEmpty) {
      _step = steps[0];
      _stepHistory.add(_step);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return WillPopScope(
      onWillPop: () async {
        if (_stepHistory.length > 1) {
          pop();
          return false;
        } else {
          return true;
        }
      },
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
              alwaysIncludeSemantics: true,
            );
          },
          child: Container(
            key: ValueKey(_step),
            child: _step,
          )),
    );
  }
}
