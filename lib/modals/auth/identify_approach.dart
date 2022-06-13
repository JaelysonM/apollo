import 'package:apollo/modals/auth/oauth_processing.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';

import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/elements/circle_icon_button.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class IdentifyApproach extends StatefulWidget {
  const IdentifyApproach({Key? key}) : super(key: key);

  @override
  State<IdentifyApproach> createState() => _IdentifyApproachState();
}

class _IdentifyApproachState extends State<IdentifyApproach> {
  @override
  Widget build(BuildContext context) {
    return DefaultModalContainer(child: render());
  }

  Widget render() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Align(
        alignment: Alignment.topLeft,
        child: DefaultApproachHeader(
          title: "Entre",
          description:
              "Para melhorar sua experiência precisamos\n que você se identifique",
        ),
      ),
      const SizedBox(
        height: 23,
      ),
      _renderOptionsContainer(),
      _renderBottom()
    ]);
  }

  _renderOptionsContainer() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Entre com sua rede social favorita',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          _renderAuthOptions()
        ]);
  }

  _renderAuthOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _renderOAuthOptions(),
        const LargeTextHeader(content: 'Ou', fontSize: 12),
        DefaultButton(
          child: const LargeTextHeader(content: "Email", fontSize: 18),
          backgroundColor: kSystemLightPurple,
          onPressed: () {
            RouteUtils.showModal(
              context,
              route: 'login',
            );
          },
        )
      ],
    );
  }

  _renderOAuthOptions() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CircleIconButton(
        buttonColor: Colors.white,
        imagePath: 'assets/images/google.png',
        onPressed: () {
          RouteUtils.showOrPushModal(
            context,
            cleanAll: true,
            modalContent:
                const OAuthProcessing(authProvider: OAuthProviderType.google),
          );
        },
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

  Widget _renderBottom() {
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
                    RouteUtils.showModal(
                      context,
                      route: 'register',
                    );
                  }),
            ],
          ),
        ));
  }
}
