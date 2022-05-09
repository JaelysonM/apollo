import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

import '../constants/globals.dart';
import '../widgets/elements/circle_icon_button.dart';
import '../widgets/elements/tiny_text_field.dart';

class RegisterSection extends StatefulWidget {
  final StepForm stepForm;
  final int offset;

  final TextEditingController textEditingController = TextEditingController();

  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final Function? onChanged;

  RegisterSection({
    Key? key,
    required this.stepForm,
    required this.offset,
    this.onNext,
    this.onPrevious,
    this.onChanged,
  }) : super(key: key);

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  Widget _renderSection() {
    StepFormSection section = widget.stepForm.steps.elementAt(widget.offset);

    return Column(children: [
      DefaultApproachHeader(
        title: widget.stepForm.title,
        description: widget.stepForm.description,
      ),
      const SizedBox(height: 25),
      _renderTextField(section.label),
      _renderBottom()
    ]);
  }

  Widget _renderTextField(String label) {
    return TinyTextField(
      label: label,
      controller: widget.textEditingController,
      onChanged: (text) {
        setState(() {
          value = text;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(text);
        }
      },
      autoFocus: true,
      child: CircleIconButton(
        icon: Icons.arrow_forward,
        onPressed: () {
          if (widget.onNext != null) {
            widget.onNext!();
          }
        },
      ),
    );
  }

  Widget _renderBottom() {
    return Container(
        margin: const EdgeInsets.only(top: 44),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TinyText(
                content: 'Já tem uma conta?',
                fontSize: 14,
              ),
              const SizedBox(width: 7),
              ClickableText(
                  content: 'Logue-se',
                  onTap: () {
                    print('Ir para tela de login');
                  }),
            ],
          ),
        ));
  }
}
