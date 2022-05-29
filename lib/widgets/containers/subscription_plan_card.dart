import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:apollo/widgets/styles/clickable_text.dart';
import 'package:apollo/widgets/styles/tiny_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final SubscriptionPlan subscriptionPlan;
  final Function? onTap;
  const SubscriptionPlanCard(
      {Key? key, required this.subscriptionPlan, this.onTap})
      : super(key: key);

  Widget _renderCardHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(subscriptionPlan.company.imageURL),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              subscriptionPlan.company.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto Condensed',
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _renderCardBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TinyText(
            content: "Plano: ${subscriptionPlan.name}",
            fontSize: 16,
          ),
          MixedText([
            TextSpan(
              text:
                  "${subscriptionPlan.price.toStringAsFixed(2).split('.')[0]}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text:
                  ".${subscriptionPlan.price.toStringAsFixed(2).split('.')[1]} / ${subscriptionPlan.getRecurrenceRuleLabel()}",
              style: const TextStyle(),
            ),
          ], size: 12)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTap?.call(),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 27),
            child: DottedBorder(
              strokeWidth: 0.5,
              dashPattern: const [2],
              borderType: BorderType.RRect,
              color: Colors.white,
              radius: const Radius.circular(25),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                  child: Column(
                    children: [_renderCardHeader(), _renderCardBody()],
                  )),
            )));
  }
}
