import 'package:apollo/constants/colors.dart';
import 'package:apollo/modals/login/login_email_step.dart';
import 'package:apollo/modals/login/login_password_step.dart';
import 'package:apollo/modals/register/register_name_step.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:apollo/widgets/elements/circle_icon_button.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class IdentifyApproach extends StatelessWidget {
  const IdentifyApproach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: render(context),
    );
  }

  Widget render(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Align(
        alignment: Alignment.topLeft,
        child: DefaultApproachHeader(
          title: "Entre",
          description:
              "Para melhorar sua experiência precisamos\n que você se identifique",
        ),
      ),
      SizedBox(
        height: 23,
      ),
      _renderOptionsContainer(context),
      _renderBottom(context)
    ]);
  }

  _renderOptionsContainer(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entre com sua rede social favorita',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 19,
          ),
          _renderAuthOptions(context)
        ]);
  }

  _renderAuthOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _renderOAuthOptions(context),
        LargeTextHeader(content: 'Ou', fontSize: 12),
        DefaultButton(
          child: const LargeTextHeader(content: "Email", fontSize: 18),
          backgroundColor: kSystemLightPurple,
          onPressed: () {
            MutableModalContent.of(context)?.push(LoginEmailStep());
          },
        )
      ],
    );
  }

  _renderOAuthOptions(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CircleIconButton(
            buttonColor: Colors.white,
            imagePath: 'assets/images/google_icon.png',
          ),
          CircleIconButton(
            iconColor: Colors.white,
            buttonColor: Colors.black,
            icon: FontAwesomeIcons.apple,
          ),
          CircleIconButton(
            iconColor: Colors.white,
            buttonColor: Colors.blue,
            icon: FontAwesomeIcons.twitter,
          )
        ]);
  }

  Widget _renderBottom(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 44),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TinyText(
                content: 'Não tem conta?',
                fontSize: 14,
              ),
              const SizedBox(width: 7),
              ClickableText(
                  content: 'Registre-se',
                  onTap: () {
                    MutableModalContent.of(context).push(RegisterNameStep());
                  }),
            ],
          ),
        ));
  }
}
