import 'package:apollo/services/auth_service.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/left_icon_text.dart';
import 'package:apollo/widgets/elements/separator.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/small_section_title.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserGeralSection extends StatefulWidget {
  const UserGeralSection({Key? key}) : super(key: key);

  @override
  State<UserGeralSection> createState() => _UserGeralSectionState();
}

class _UserGeralSectionState extends State<UserGeralSection> {
  Widget _renderSection(Widget parent, {bool last = false}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: parent,
        ),
        if (!last) const Separator(color: Colors.white),
      ],
    );
  }

  logout() {
    AuthService auth = Provider.of<AuthService>(context, listen: false);
    auth.logout();
  }

  Widget _renderOptions() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
          vertical: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _renderSection(LeftIconText(
              onTap: () {
                RouteUtils.showModal(context, route: 'payment_methods');
              },
              text: 'Métodos de pagamento',
              icon: Icons.credit_card,
            )),
            _renderSection(LeftIconText(
              onTap: () {
                RouteUtils.showModal(context, route: 'spending_history');
              },
              text: 'Histórico de gastos',
              icon: Icons.article,
            )),
            _renderSection(
              const LeftIconText(
                text: 'Meus dados',
                icon: Icons.person,
              ),
            ),
            _renderSection(
              const LeftIconText(
                text: 'Configurações',
                icon: Icons.settings,
              ),
            ),
            _renderSection(
                const LeftIconText(
                  text: 'Me ajuda',
                  icon: Icons.question_answer,
                ),
                last: true),
          ],
        ),
      ),
    );
  }

  Widget _renderLogout() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
        child: ClickableText(
            onTap: () {
              logout();
            },
            content: "Sair do app",
            style: TextStyle(color: kErrorRed, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _renderPolicyAndTerms() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
        child:
            const TinyText(content: 'Política de privacidade - Termos de uso'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SmallSectionTitle('Geral'),
        _renderOptions(),
        _renderLogout(),
        _renderPolicyAndTerms(),
      ],
    );
  }
}
