import 'package:apollo/models/account.dart';
import 'package:apollo/models/company_account.dart';
import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/services/auth_service.dart';
import 'package:apollo/widgets/containers/my_plans.dart';
import 'package:apollo/widgets/containers/screen_header_container.dart';
import 'package:apollo/widgets/containers/top_recurrence.dart';
import 'package:apollo/widgets/containers/total_return_card.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlansCompany extends StatelessWidget {
  final int clientsInSubscription = 2;
  final double totalReturnPercentage = 55;
  final double totalReturn = 110;
  final String topPlan = "Plano mensal";
  const PlansCompany({Key? key}) : super(key: key);
  Widget _renderCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TotalReturnCard(
            percentage: totalReturnPercentage,
            total: totalReturn,
          ),
          TopRecurrence(
            topPlan: topPlan,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = Provider.of<AuthService>(context);
    Account? account = authService.account;
    return Column(
      children: [
        ScreenHeader(
            showDate: true,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 145),
              child: MixedText([
                const TextSpan(text: 'Você tem '),
                TextSpan(
                    text: clientsInSubscription > 0
                        ? clientsInSubscription.toString()
                        : 'nenhuma ',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: clientsInSubscription > 1
                        ? ' clientes assinaturas'
                        : ' cliente assinatura'),
              ], size: 16, weight: FontWeight.w300),
            )),
        const SizedBox(
          height: 20,
        ),
        _renderCards(),
        const SizedBox(
          height: 40,
        ),
        MyPlans()
      ],
    );
  }
}
