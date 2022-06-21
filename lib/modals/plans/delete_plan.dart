import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/default_modal_container.dart';
import 'package:apollo/widgets/elements/default_button.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

class DeletePlan extends StatelessWidget {
  final SubscriptionPlan plan;
  const DeletePlan({Key? key, required this.plan}) : super(key: key);

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
                    onPressed: () {},
                  )
                ])));
  }
}
