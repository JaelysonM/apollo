import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/circle_icon_button.dart';
import 'package:apollo/widgets/elements/tiny_text_field.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class EmailStep extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  Function? onNext;

  EmailStep({Key? key, this.onNext}) : super(key: key);

  @override
  State<EmailStep> createState() => _EmailStepState();
}

class _EmailStepState extends State<EmailStep> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  Widget _renderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DefaultApproachHeader(
        title: "Entre",
        description: "Apenas dados básicos",
      ),
      const SizedBox(height: 25),
      _renderTextField('Email'),
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
