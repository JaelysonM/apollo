import 'package:apollo/utils/route_utils.dart';
import 'package:apollo/widgets/containers/left_icon_text.dart';
import 'package:apollo/widgets/elements/separator.dart';
import 'package:apollo/widgets/styles/small_section_title.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class UserGeralSection extends StatelessWidget {
  const UserGeralSection({Key? key}) : super(key: key);

  Widget _renderMarginWidget(Widget parent) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: parent,
    );
  }

  Widget _renderOptions(BuildContext context) {
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
            _renderMarginWidget(LeftIconText(
              onTap: () {
                RouteUtils.showModal(context, route: 'payment_methods');
              },
              text: 'Métodos de pagamento',
              icon: Icons.credit_card,
            )),
            _renderMarginWidget(LeftIconText(
              onTap: () {
                RouteUtils.showModal(context, route: 'spending_history');
              },
              text: 'Histórico de gastos',
              icon: Icons.article,
            )),
            const SizedBox(height: 2),
            const Separator(color: Colors.white),
            const SizedBox(height: 2),
            _renderMarginWidget(
              const LeftIconText(
                text: 'Meus dados',
                icon: Icons.person,
              ),
            ),
            _renderMarginWidget(
              const LeftIconText(
                text: 'Configurações',
                icon: Icons.settings,
              ),
            ),
            _renderMarginWidget(
              const LeftIconText(
                text: 'Me ajuda',
                icon: Icons.question_answer,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderPolicyAndTerms() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
        child:
            const TinyText(content: 'Política de privacidade - termos de uso'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SmallSectionTitle('Geral'),
        _renderOptions(context),
        _renderPolicyAndTerms(),
      ],
    );
  }
}
