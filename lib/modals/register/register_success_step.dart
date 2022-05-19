import 'package:apollo/constants/colors.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/styles/default_bold_text.dart';
import 'package:apollo/widgets/styles/default_regular_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/styles/large_text_header.dart';

class RegisterSuccessStep extends StatelessWidget {
  const RegisterSuccessStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultModalContainer(
      child: _renderPresentation(context),
    );
  }

  Widget _renderPresentation(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultApproachHeader(
              title: "Pronto!",
              description:
                  "Deu tudo certo! Você já pode usar o app do seu jeito."),
          const SizedBox(height: 24),
          DefaultButton(
            child: LargeTextHeader(
              content: "Email",
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
