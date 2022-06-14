import 'package:apollo/models/account.dart';
import 'package:apollo/models/user.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/styles/default_bold_text.dart';
import 'package:apollo/widgets/styles/default_regular_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class LoginSuccess extends StatelessWidget {
  final Account account;
  const LoginSuccess({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _renderPresentation(context);
  }

  Widget _renderPresentation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          account is User ? Icons.face_outlined : Icons.store_outlined,
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
      DefaultBoldText(content: account.getIdentifier()),
    ]);
  }

  Widget _renderGreeting() {
    return const TinyText(content: "Bom tê-lo de volta");
  }
}
