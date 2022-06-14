import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/elements/circle_icon_button.dart';
import 'package:apollo/widgets/form/form_step.dart';
import 'package:apollo/widgets/form/form_with_step.dart';
import 'package:apollo/widgets/form/text_input.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class GenericLoginStep extends FormStep {
  final String label;
  final String name;
  final TextInputType type;
  final String? equalTo;
  final String? equalToLabel;
  final Function? validator;
  final bool company;

  const GenericLoginStep(this.label, this.name,
      {Key? key,
      this.type = TextInputType.text,
      this.validator,
      this.equalTo,
      this.equalToLabel,
      this.company = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, FormWithStepContentState? stepForm) {
    return DefaultModalContainer(
      child: _renderSection(stepForm, context),
    );
  }

  Widget _renderSection(
      FormWithStepContentState? stepForm, BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const DefaultApproachHeader(
        title: "Entre",
        description: "Apenas dados básicos",
      ),
      const SizedBox(height: 25),
      TextInput(
        label: label,
        name: name,
        type: type,
        equalToLabel: equalToLabel,
        equalTo: equalTo,
        validator: validator,
        child: CircleIconButton(
          icon: Icons.arrow_forward,
          onPressed: () {
            stepForm!.next();
          },
        ),
      ),
      _renderBottom(context)
    ]);
  }

  Widget _renderBottom(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 44),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TinyText(
                content: 'Não tem uma conta?',
                fontSize: 14,
              ),
              const SizedBox(width: 7),
              ClickableText(
                  content: 'Registre-se',
                  onTap: () {
                    RouteUtils.showModal(context,
                        route: 'register',
                        cleanHistory: true,
                        company: company);
                  }),
            ],
          ),
        ));
  }
}
