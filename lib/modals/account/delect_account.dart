import 'package:apollo/modals/account/confirm_account_deletion.dart';
import 'package:apollo/widgets/containers/center_popup_modal.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/elements/dot_widget.dart';
import 'package:apollo/widgets/elements/tiny_text_field.dart';
import 'package:apollo/widgets/elements/touchable_opacity.dart';
import 'package:apollo/widgets/form/form.dart';
import 'package:apollo/widgets/form/text_input.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

bool checkValue = false;
bool checkValue1 = false;
bool checkValue2 = false;
bool checkValue3 = false;

class DelectAccount extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  Function? onNext;

  DelectAccount({Key? key, this.onNext}) : super(key: key);

  @override
  State<DelectAccount> createState() => _DelectAccount();
}

class _DelectAccount extends State<DelectAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
        child: CustomForm(name: "Delect Account", children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const DefaultApproachHeader(
              title: "Excluir conta",
              titleFontSize: 30,
              description:
                  "Conta pra gente o motivo de você querer                            excluir sua conta",
            ),
            const SizedBox(height: 15),
            Row(children: [
              Checkbox(
                  shape: CircleBorder(),
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.resolveWith(
                      (Color) => Colors.white),
                  value: checkValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkValue = value!;
                    });
                  }),
              const Text('Questões de privacidade',
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ]),
            Row(children: [
              Checkbox(
                  shape: CircleBorder(),
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.resolveWith(
                      (Color) => Colors.white),
                  value: checkValue1,
                  onChanged: (bool? value) {
                    setState(() {
                      checkValue1 = value!;
                    });
                  }),
              const Text('Problemas para começar',
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ]),
            Row(children: [
              Checkbox(
                  shape: CircleBorder(),
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.resolveWith(
                      (Color) => Colors.white),
                  value: checkValue2,
                  onChanged: (bool? value) {
                    setState(() {
                      checkValue2 = value!;
                    });
                  }),
              const Text('Criei outra conta',
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ]),
            Row(children: [
              Checkbox(
                  shape: CircleBorder(),
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.resolveWith(
                      (Color) => Colors.white),
                  value: checkValue3,
                  onChanged: (bool? value) {
                    setState(() {
                      checkValue3 = value!;
                    });
                  }),
              const Text('Quero dar um tempo',
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ]),
            const SizedBox(
              height: 20,
            ),
            TextInput(
              name: "Senha ",
              label: "Digite sua senha",
            ),
            Container(
                alignment: Alignment.topRight,
                child: TouchableOpacity(
                    child: Text("Esqueceu sua senha?",
                        style: TextStyle(color: Colors.grey.shade600)))),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Sua conta será excluída em 30 dias. Se mudar de ideia, você pode acessar sua conta antes da data de exclusão para mantê-la",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.topCenter,
              child: const DotWidget(
                dashColor: Colors.white,
                dashHeight: 2,
                dashWidth: 3,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: DefaultButton(
                child: const LargeTextHeader(
                    content: "Excluir conta", fontSize: 18),
                backgroundColor: Colors.red.shade700,
                onPressed: () {
                  Navigator.of(context).pop();
                  CenterPopupModal.showModal(context, ConfirmDeletion());
                },
              ),
            )
          ]),
        ]));
  }
}
