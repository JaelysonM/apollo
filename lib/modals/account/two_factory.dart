import 'package:apollo/shared/constants/colors.dart';

import 'package:apollo/widgets/elements/back_button.dart';
import 'package:apollo/widgets/elements/default_button.dart';

import 'package:flutter/material.dart';

class TwoFactory extends StatefulWidget {
  const TwoFactory({Key? key}) : super(key: key);

  @override
  State<TwoFactory> createState() => _TwoFactory();
}

class _TwoFactory extends State<TwoFactory> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kThemeBackground,
        body: SafeArea(
            child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(children: [
              DefaultBackButton(),
              Text(
                "Confirmação em duas etapas",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ]),
          ),
          Column(children: [
            Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.blue.withOpacity(0.2),
                      size: 140,
                    ),
                    Icon(
                      Icons.rectangle_rounded,
                      color: Colors.blue.shade300,
                      size: 90,
                    ),
                    Icon(
                      Icons.onetwothree_outlined,
                      color: Colors.black87,
                      size: 50,
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                "Para mais segurança, ative a confirmação em duas etapas que solicitará um PIN quando você registrar seu número de telefone no Apollo novamente.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              ),
            ),
            DefaultButton(child: Text("ATIVAR"))
          ])
        ])));
  }
}
