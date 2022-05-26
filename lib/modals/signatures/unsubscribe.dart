import 'dart:async';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/styles/large_text_header.dart';

bool checkValue = false;
bool checkValue1 = false;
bool checkValue2 = false;

class Unsubscribe extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();

  Function? onNext;

  Unsubscribe({Key? key, this.onNext}) : super(key: key);

  @override
  State<Unsubscribe> createState() => _Unsubscribe();
}

class _Unsubscribe extends State<Unsubscribe> {
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
        title: "Cancelar assinatura",
        titleFontSize: 30,
        description:
            "Conta pra gente o motivo de você querer                            cancelar sua assinatura",
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
        Text('Muito caro.', style: TextStyle(color: Colors.white, fontSize: 16))
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
        Text('Não usei tudo.',
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
        Text('Não gostei do serviço.',
            style: TextStyle(color: Colors.white, fontSize: 16))
      ]),
      DefaultApproachHeader(
        title: "Resumo",
        titleFontSize: 24,
        description: " ",
      ),
      Row(
        children: [
          Text(
            '10 dias',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            ' restantes de assinatura',
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
      Text(
        '...................................................................................................',
        style: TextStyle(color: Colors.white),
      ),
      SizedBox(
        height: 15,
      ),
      Center(
          child: DefaultButton(
        child:
            const LargeTextHeader(content: "Cancelar de graça", fontSize: 18),
        backgroundColor: kSystemPurple,
        onPressed: () {},
      ))
    ]);
  }
}
