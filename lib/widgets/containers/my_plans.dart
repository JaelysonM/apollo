import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/no_results_found.dart';
import 'package:apollo/widgets/containers/plan_card.dart';
import 'package:apollo/widgets/elements/tad_button.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:flutter/material.dart';

class MyPlans extends StatefulWidget {
  final TextEditingController _controller = TextEditingController();

  final List<SubscriptionPlan> plans;

  MyPlans({Key? key, required this.plans}) : super(key: key);

  @override
  State<MyPlans> createState() => _MyPlansState();
}

class _MyPlansState extends State<MyPlans> {
  Widget _renderPlans() {
    return widget.plans.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: widget.plans.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return PlanCard(
                plan: widget.plans[index],
                onTap: () => {},
              );
            })
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: const NoResultsFound(
                iconData: Icons.production_quantity_limits,
                textSize: 14,
                text: "Você não tem nenhum plano :("));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Column(children: [
              Row(
                children: [
                  const Text(
                    'Seus planos',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  TADButton(
                    onPressed: () {
                      RouteUtils.showModal(context, route: 'create_plan');
                    },
                  )
                ],
              ),
              _renderAbout(context)
            ]),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Flexible(child: _renderPlans()),
      ],
    );
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
}
