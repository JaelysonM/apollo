// import 'package:apollo/shared/constants/colors.dart';
// import 'package:apollo/widgets/containers/default_approach_header.dart';
// import 'package:apollo/widgets/containers/my_plans.dart';
// import 'package:apollo/widgets/elements/default_button.dart';
// import 'package:apollo/widgets/elements/rounded_text_field.dart';
// import 'package:apollo/widgets/styles/large_text_header.dart';
// import 'package:flutter/material.dart';

// class CreatePlan extends StatefulWidget {
//   final MyPlansState? myPlansState;
//   const CreatePlan({Key? key, this.myPlansState}) : super(key: key);

//   @override
//   State<CreatePlan> createState() => _CreatePlanState();
// }

// class _CreatePlanState extends State<CreatePlan> {
//   //String _value = '';

//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
//       child: _renderSection(),
//     );
//   }

//   double _currentValue = 0;
//   double _currentValue1 = 0;
//   Widget _renderSection() {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       DefaultApproachHeader(
//         title: "Touch-And-Deploy",
//         titleFontSize: 30,
//         description:
//             "É rápido e fácil! Coloque um nome para o plano, o número de vezes para ser utilizado e seu preço mensal.",
//       ),
//       SizedBox(height: 15),
//       RoundedTextField(
//         label: 'Nome do plano',
//         controller: widget.textEditingController,
//         onChanged: () {},
//       ),
//       //SizedBox(height: 12),
//       Slider(
//         min: 0.0,
//         max: 200.0,
//         value: _currentValue,
//         divisions: 99999,
//         //label: '${_currentValue.round()}',
//         onChanged: (value) {
//           setState(() {
//             _currentValue = value;
//           });
//         },
//       ),
//       Text(
//         'Preço: ${_currentValue.toStringAsFixed(2).toString()}                                                               R\$',
//         style: TextStyle(
//             color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
//       ),
//       Slider(
//         min: 0.0,
//         max: 31.0,
//         value: _currentValue1,
//         divisions: 31,
//         //label: '${_currentValue.round()}',
//         onChanged: (value) {
//           setState(() {
//             _currentValue1 = value;
//           });
//         },
//       ),
//       Text(
//         'Nº de vezes ${_currentValue1.toStringAsFixed(0).toString()} ',
//         style: TextStyle(
//             color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
//       ),
//       SizedBox(height: 9),
//       DefaultButton(
//         child: const LargeTextHeader(content: "Deploy", fontSize: 18),
//         backgroundColor: kSystemPurple,
//         onPressed: () {},
//       )
//     ]);
//   }
// }

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

class CreatePlan extends StatelessWidget {
  final MyPlansState? myPlansState;
  const CreatePlan({Key? key, this.myPlansState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 30),
      child: CustomForm(
          initialValues: {
            "interval": 2.0,
            "price": 0.0,
            'recurrenceRule': 'monthly'
          },
          onSubmit: (form) {
            RouteUtils.showOrPushModal(context,
                cleanAll: true,
                modalContent: PlanProcessing(
                  myPlansState: myPlansState,
                  action: PlanAction.create,
                  planDto: PlanDto.fromJson(form),
                ));
          },
          name: 'create_plan',
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const DefaultApproachHeader(
                title: "Touch-And-Deploy",
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
                min: 0,
                divisions: 30,
              ),
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
