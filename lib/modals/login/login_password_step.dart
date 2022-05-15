import 'package:apollo/modals/login/login_success_step.dart';
import 'package:apollo/models/user_account.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:apollo/widgets/elements/circle_icon_button.dart';
import 'package:apollo/widgets/elements/tiny_text_field.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class LoginPasswordStep extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  final Function? onNext;

  LoginPasswordStep({Key? key, this.onNext}) : super(key: key);

  @override
  State<LoginPasswordStep> createState() => _LoginPasswordStepState();
}

class _LoginPasswordStepState extends State<LoginPasswordStep> {
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
      DefaultApproachHeader(
        title: "Entre",
        description: "Apenas dados básicos",
      ),
      const SizedBox(height: 25),
      _renderTextField('Sua senha'),
      _renderBottom()
    ]);
  }

  Widget _renderTextField(String label) {
    return Form(
        key: _formKey,
        child: TinyTextField(
          type: TextInputType.visiblePassword,
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
                  MutableModalContent.of(context).push(LoginSuccessStep(
                      account: UserAccount(
                    id: "1",
                    email: 'jaelysonmartins@gmail.com',
                    firstName: 'Jaelyson',
                    lastName: 'Martins',
                  )));
                  MutableModalContent.of(context).clean();
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
                content: 'Não tem uma conta?',
                fontSize: 14,
              ),
              const SizedBox(width: 7),
              ClickableText(
                  content: 'Registre-se',
                  onTap: () {
                    print('Ir para o modal de registro');
                  }),
            ],
          ),
        ));
  }
}
