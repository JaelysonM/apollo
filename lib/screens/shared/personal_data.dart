import 'package:apollo/modals/account/delect_account.dart';
import 'package:apollo/modals/account/security.dart';
import 'package:apollo/modals/account/two_factory.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/custom_page_route.dart';
import 'package:apollo/widgets/containers/screen_header_container.dart';
import 'package:apollo/widgets/containers/top_header.dart';
import 'package:apollo/widgets/elements/back_button.dart';
import 'package:apollo/widgets/elements/separator.dart';
import 'package:apollo/widgets/elements/touchable_opacity.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:flutter/material.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({Key? key}) : super(key: key);

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
              "Seus Dados",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        _renderTouchableOpacityData("Editar perfil", () {}),
        _renderTouchableOpacityData("Alterar senha", () {}),
        _renderTouchableOpacityData("Segurança", () {
          Navigator.of(context).push(CustomPageRoute(
              child: Security(), direction: AxisDirection.left));
        }),
        _renderTouchableOpacityData("Confirmação de duas etapas", () {
          Navigator.of(context).push(CustomPageRoute(
              child: TwoFactory(), direction: AxisDirection.left));
        }),
        _renderTouchableOpacityData("Excluir minha conta", () {
          RouteUtils.showOrPushModal(context, modalContent: DelectAccount());
        }),
      ])),
    );
  }

  Widget _renderTouchableOpacityData(String text, Function? onTap) {
    return TouchableOpacity(
      onTap: () {
        onTap?.call();
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          alignment: Alignment.topLeft,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Separator(color: Colors.white),
          ])),
    );
  }
}
