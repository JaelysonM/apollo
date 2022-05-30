import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/styles/large_text_header.dart';

bool checkValue = false;
bool checkValue1 = false;
bool checkValue2 = false;

class DeselectService extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  Function? onNext;

  DeselectService({Key? key, this.onNext}) : super(key: key);

  @override
  State<DeselectService> createState() => _DeselectService();
}

class _DeselectService extends State<DeselectService> {
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
        title: "Desmarcar serviço",
        titleFontSize: 30,
        description:
            "Conta pra gente o motivo de você querer                            desmarcar esse serviço",
      ),
      SizedBox(height: 15),
      Row(children: [
        Checkbox(
            shape: CircleBorder(),
            checkColor: Colors.black,
            fillColor:
                MaterialStateProperty.resolveWith((Color) => Colors.white),
            value: checkValue,
            onChanged: (bool? value) {
              setState(() {
                checkValue = value!;
              });
            }),
        Text('O cliente não apareceu',
            style: TextStyle(color: Colors.white, fontSize: 16))
      ]),
      Row(children: [
        Checkbox(
            shape: CircleBorder(),
            checkColor: Colors.black,
            fillColor:
                MaterialStateProperty.resolveWith((Color) => Colors.white),
            value: checkValue1,
            onChanged: (bool? value) {
              setState(() {
                checkValue1 = value!;
              });
            }),
        Text('Houve um imprevisto',
            style: TextStyle(color: Colors.white, fontSize: 16))
      ]),
      Row(children: [
        Checkbox(
            shape: CircleBorder(),
            checkColor: Colors.black,
            fillColor:
                MaterialStateProperty.resolveWith((Color) => Colors.white),
            value: checkValue2,
            onChanged: (bool? value) {
              setState(() {
                checkValue2 = value!;
              });
            }),
        Text('Outro', style: TextStyle(color: Colors.white, fontSize: 16))
      ]),
      DefaultApproachHeader(
        title: "Resumo",
        titleFontSize: 30,
        description:
            "Atenção não é ideal desmarcar o serviço em cima da hora, logo você será prejudicado, tem certeza? Veja o que irá acontecer com sua conta",
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        '- Reputação da sua empresa \n- Compromisso \n- Visibilidade',
        style:
            TextStyle(color: Colors.red.shade200, fontWeight: FontWeight.bold),
      ),
      Text(
        '...................................................................................................',
        style: TextStyle(color: Colors.white),
      ),
      Center(
          child: DefaultButton(
        child: const LargeTextHeader(content: "Desmarcar", fontSize: 18),
        backgroundColor: kSystemPurple,
        onPressed: () {},
      ))
    ]);
  }
}
