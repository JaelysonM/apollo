import 'package:apollo/constants/colors.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/styles/large_text_header.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _renderPresentation(context);
  }

  Widget _renderPresentation(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultApproachHeader(
              title: "Pronto!",
              description:
                  "Deu tudo certo! Você já pode usar o app do seu jeito."),
          const SizedBox(height: 24),
          DefaultButton(
            child: const LargeTextHeader(
              content: "Vamos lá!",
              fontSize: 18,
            ),
            backgroundColor: kSystemPurple,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ]);
  }
}
