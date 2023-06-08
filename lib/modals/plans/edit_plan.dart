import 'package:apollo/dtos/plan_dto.dart';
import 'package:apollo/modals/plans/plan_processing.dart';
import 'package:apollo/models/subscription_plan.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';
import 'package:apollo/widgets/containers/my_plans.dart';
import 'package:apollo/widgets/form/dropdown_input.dart';
import 'package:apollo/widgets/form/form.dart';
import 'package:apollo/widgets/form/slider_input.dart';
import 'package:apollo/widgets/form/submit_botton.dart';
import 'package:apollo/widgets/form/text_input.dart';
import 'package:apollo/widgets/styles/large_text_header.dart';
import 'package:flutter/material.dart';

class EditPlan extends StatelessWidget {
  final SubscriptionPlan plan;

  final MyPlansState? myPlansState;
  const EditPlan({Key? key, this.myPlansState, required this.plan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: CustomForm(
          initialValues: {
            'name': plan.name,
            'price': plan.price,
            'interval': plan.interval,
            'recurrenceRule': plan.recurrenceRule.name,
          },
          onSubmit: (form) {
            RouteUtils.showOrPushModal(context,
                cleanAll: true,
                modalContent: PlanProcessing(
                  myPlansState: myPlansState,
                  action: PlanAction.edit,
                  planDto: PlanDto.fromJson({
                    ...form,
                    'id': plan.documentId(),
                  }),
                ));
          },
          name: 'create_plan',
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const DefaultApproachHeader(
                title: "Touch-And-Deploy - Edição",
                titleFontSize: 30,
                description:
                    "É rápido e fácil! Coloque um nome para o plano, o número de vezes para ser utilizado e seu preço mensal.",
              ),
              const SizedBox(height: 20),
              TextInput(
                name: 'name',
                labelFontSize: 16,
                label: 'Nome do plano',
                theme: TextInputTheme.rounded,
              ),
              const SizedBox(height: 20),
              const SliderInput(
                  label: "Preço: R\$%1\$", name: 'price', max: 200, min: 0),
              const SliderInput(
                  label: "Intervalo de recorrência: %1\$",
                  name: 'interval',
                  max: 30,
                  min: 0),
              const SizedBox(height: 9),
              DropdownInput(
                name: 'recurrenceRule',
                label: 'Regra de recorrência',
                items: RecurrenceRule.values.map((e) => e.name).toList(),
                displayComposer: (value) =>
                    Text(SubscriptionPlan.getRecurrenceRuleDisplay(value)),
              ),
              const SubmitButton(
                  child: LargeTextHeader(content: "Deploy!", fontSize: 18))
            ]),
          ]),
    );
  }
}
