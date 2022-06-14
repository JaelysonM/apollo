import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/no_results_found.dart';
import 'package:apollo/widgets/containers/subscription_plan_card.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class AllSubscriptions extends StatelessWidget {
  final List<SubscriptionPlan> subscriptionPlans;
  const AllSubscriptions({Key? key, required this.subscriptionPlans})
      : super(key: key);

  Widget _renderSubscriptionPlans() {
    return subscriptionPlans.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: subscriptionPlans.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SubscriptionPlanCard(
                  subscriptionPlan: subscriptionPlans[index]);
            })
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: const NoResultsFound(
                iconData: Icons.star_half,
                textSize: 14,
                text: "Não existe nenhuma assinatura disponível :("));
  }

  Widget _renderAbout(BuildContext context) {
    return Row(
      children: [
        const TinyText(content: 'Não conhece esse serviço? '),
        ClickableText(
          content: "Saiba mais",
          color: kLightBlue,
          onTap: () {
            RouteUtils.showModal(context, route: 'about_subscription');
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Planos de assinaturas',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _renderAbout(context),
                ]),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        _renderSubscriptionPlans()
      ],
    );
  }
}
