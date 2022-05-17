import 'package:apollo/constants/colors.dart';
import 'package:apollo/models/account.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/styles/default_bold_text.dart';
import 'package:apollo/widgets/styles/default_regular_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class LoginSuccessStep extends StatelessWidget {
  final Account account;
  const LoginSuccessStep({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultModalContainer(
      child: _renderPresentation(context),
    );
  }

  Widget _renderPresentation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.face_outlined,
          color: kLightGreen,
          size: 54,
        ),
        _renderWelcome(),
        _renderGreeting()
      ],
    );
  }

  Widget _renderWelcome() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const DefaultRegularText(content: 'Bem vindo de volta,'),
      DefaultBoldText(content: account.getFirstName()),
    ]);
  }

  Widget _renderGreeting() {
    return const TinyText(content: "Bom tê-lo de volta");
  }
}
