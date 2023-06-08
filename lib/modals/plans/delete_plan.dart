import 'package:apollo/dtos/plan_dto.dart';
import 'package:apollo/modals/plans/plan_processing.dart';
import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/containers/my_plans.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

class DeletePlan extends StatelessWidget {
  final SubscriptionPlan plan;
  final MyPlansState? myPlansState;
  const DeletePlan({Key? key, required this.plan, this.myPlansState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultModalContainer(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultApproachHeader(
                      title: "Apagar plano",
                      descriptionFontSize: 18,
                      description: [
                        const TextSpan(text: 'Deseja apagar o plano'),
                        TextSpan(
                            text: ' ${plan.name}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: '?')
                      ]),
                  const SizedBox(height: 15),
                  DefaultButton(
                    child:
                        const LargeTextHeader(content: "Apagar", fontSize: 18),
                    backgroundColor: kSystemPurple,
                    onPressed: () {
                      RouteUtils.showOrPushModal(context,
                          cleanAll: true,
                          modalContent: PlanProcessing(
                            myPlansState: myPlansState,
                            action: PlanAction.delete,
                            planDto: PlanDto(
                                id: plan.documentId(),
                                name: plan.name,
                                price: plan.price,
                                interval: plan.interval,
                                recurrenceRule: plan.recurrenceRule),
                          ));
                    },
                  )
                ])));
  }
}
