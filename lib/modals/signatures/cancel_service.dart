import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

bool checkValue = false;
bool checkValue1 = false;
bool checkValue2 = false;
bool checkValue3 = false;

class CancelService extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  Function? onNext;

  CancelService({Key? key, this.onNext}) : super(key: key);

  @override
  State<CancelService> createState() => _CancelService();
}

class _CancelService extends State<CancelService> {
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
        title: "Cancelar serviço",
        titleFontSize: 30,
        description:
            "Conta pra gente o motivo de você querer                            cancelar esse serviço",
      ),
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
        Text('Não gostei do serviço.',
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
        Text('Vou me atrasar.',
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
        Text('A empresa não existe.',
            style: TextStyle(color: Colors.white, fontSize: 16))
      ]),
      Row(children: [
        Checkbox(
            shape: CircleBorder(),
            checkColor: Colors.black,
            fillColor:
                MaterialStateProperty.resolveWith((Color) => Colors.white),
            value: checkValue3,
            onChanged: (bool? value) {
              setState(() {
                checkValue3 = value!;
              });
            }),
        Text('Não quero mais.',
            style: TextStyle(color: Colors.white, fontSize: 16))
      ]),
      DefaultApproachHeader(
        title: "Resumo",
        titleFontSize: 24,
        description:
            "Como você está cancelando esse serviço após o período máximo, será cobrada uma taxa de cancelamento.",
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Text(
            '+30.90',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(' Taxa de cancelamento do estabelecimento',
              style: TextStyle(color: Colors.white))
        ],
      ),
      Row(
        children: [
          Text(
            '+3.99',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(' Taxa fixa de cancelamento',
              style: TextStyle(color: Colors.white))
        ],
      ),
      Text(
        '...................................................................................................',
        style: TextStyle(color: Colors.white),
      ),
      SizedBox(
        height: 7,
      ),
      Center(
          child: DefaultButton(
        child: const LargeTextHeader(content: "Cancelar", fontSize: 18),
        backgroundColor: kSystemPurple,
        onPressed: () {},
      ))
    ]);
  }
}
