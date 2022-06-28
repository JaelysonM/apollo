import 'package:apollo/shared/constants/colors.dart';

import 'package:apollo/widgets/elements/back_button.dart';
import 'package:apollo/widgets/elements/touchable_opacity.dart';

import 'package:flutter/material.dart';

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _Security();
}

class _Security extends State<Security> {
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
                "Segurança",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
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
                        Icons.shield,
                        color: Colors.blue.shade300,
                        size: 90,
                      ),
                      Icon(
                        Icons.lock,
                        color: Colors.black87,
                        size: 35,
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Text(
                  "Seus dados estão protegidos com criptografia, somente você tem acesso. Nem mesmo o Apollo pode acessá-los.",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: TouchableOpacity(
                    child: Text(
                  "Saiba mais",
                  style: TextStyle(color: kSystemDarkBlue2, fontSize: 16),
                )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 1.5,
                color: Colors.black12,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75),
                      child: Text(
                        "Mostrar notificações de segurança neste aparelho",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.only(top: 5),
                      child: Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          }),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(
                  "Receba uma notificação quando seu código de segurança mudar em uma conta protegida por criptografia. Se você usa mais de uma aparelho, ative essa configuração nos aparelhos nos quais você deseja receber a notificação.",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: TouchableOpacity(
                    child: Text(
                  "Saiba mais",
                  style: TextStyle(color: kSystemDarkBlue2, fontSize: 16),
                )),
              ),
            ],
          )
        ])));
  }
}
