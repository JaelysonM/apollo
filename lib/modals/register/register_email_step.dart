import 'package:apollo/modals/register/register_password_step.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:apollo/widgets/elements/circle_icon_button.dart';
import 'package:apollo/widgets/elements/tiny_text_field.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class RegisterEmailStep extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  final Function? onNext;

  RegisterEmailStep({Key? key, this.onNext}) : super(key: key);

  @override
  State<RegisterEmailStep> createState() => _RegisterEmailStepState();
}

class _RegisterEmailStepState extends State<RegisterEmailStep> {
  String _value = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: _renderSection(),
    );
  }

  Widget _renderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const DefaultApproachHeader(
        title: "Registre-se",
        description:
            "Para melhorar a experência precisamos que\n você se registre com algumas informações\nÉ rapidinho, prometo :)",
      ),
      const SizedBox(height: 25),
      _renderTextField('Seu email'),
      _renderBottom()
    ]);
  }

  Widget _renderTextField(String label) {
    return Form(
        key: _formKey,
        child: TinyTextField(
          label: label,
          controller: widget.textEditingController,
          onChanged: (text) {
            setState(() {
              _value = text;
            });
          },
          validator: (text) {
            if (text.isEmpty) {
              return 'Campo obrigatório';
            }
            return null;
          },
          autoFocus: false,
          child: CircleIconButton(
            icon: Icons.arrow_forward,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (widget.onNext != null) {
                  widget.onNext!(context);
                } else {
                  MutableModalContent.of(context).push(RegisterPasswordStep());
                }
              }
            },
          ),
        ));
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
                    MutableModalContent.of(context).push(RegisterEmailStep());
                  }),
            ],
          ),
        ));
  }
}
