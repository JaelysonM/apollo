import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';

import 'package:flutter/material.dart';

class SubscriptionAbout extends StatelessWidget {
  const SubscriptionAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultModalContainer(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  DefaultApproachHeader(
                      title: "Sobre as\nassinaturas",
                      descriptionFontSize: 18,
                      spacer: 20,
                      description: [
                        TextSpan(
                            text:
                                'Algumas empresa podem disponibilizar a opção de'),
                        TextSpan(
                            text: ' assinaturas',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              ', as quais oferecem uma X quantidade de vezes que podem ser utilizadas por mês, uma vez sendo assinante, você pode ir em qualquer dia disponível na agenda e sem nenhum custo a mais, usufruir dos N produtos disponíveis dentro do estabelecimento.',
                        ),
                      ]),
                ])));
  }
}
