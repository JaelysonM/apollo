import 'package:apollo/modals/plans/delete_plan.dart';
import 'package:apollo/modals/plans/edit_plan.dart';
import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:apollo/widgets/elements/touchable_opacity.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final Function? onTap;
  final Function? onTapEdit;
  final Function? onTapDelete;
  const PlanCard(
      {Key? key,
      required this.plan,
      this.onTap,
      this.onTapEdit,
      this.onTapDelete})
      : super(key: key);

  Widget _renderCardHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Text(
            plan.name,
            style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TouchableOpacity(
              onTap: () {
                if (onTapDelete != null) onTapDelete!();
              },
              child: const Icon(
                Icons.horizontal_rule,
                color: kErrorRed,
                size: 18,
              ),
            ),
            const SizedBox(width: 5),
            TouchableOpacity(
              onTap: () {
                if (onTapEdit != null) onTapEdit!();
              },
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 18,
              ),
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
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 220),
            child: MixedText([
              const TextSpan(text: 'Pode ser utilizada'),
              TextSpan(
                  text:
                      ' ${plan.interval.toStringAsFixed(0)} ${plan.interval > 1 ? 'vezes' : 'vez'} por ${plan.getRecurrenceRuleLabel()}',
                  style: const TextStyle(fontWeight: FontWeight.bold))
            ], size: 14, color: Color(0xFF9F9F9F)),
          ),
          Container(
              margin: EdgeInsets.only(right: 20),
              child: MixedText([
                TextSpan(
                  text: "${plan.price.toStringAsFixed(2).split('.')[0]}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ".${plan.price.toStringAsFixed(2).split('.')[1]}",
                  style: const TextStyle(),
                ),
              ], size: 12))
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
              borderType: BorderType.RRect,
              color: Colors.white,
              radius: const Radius.circular(25),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                  child: Column(
                    children: [_renderCardHeader(context), _renderCardBody()],
                  )),
            )));
  }
}
