import 'package:apollo/modals/plans/plan_processing.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_approach_header.dart';

import 'package:flutter/material.dart';

class PlanSuccess extends StatelessWidget {
  final PlanAction action;
  const PlanSuccess({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: _renderPresentation(context),
    );
  }

  Widget _renderPresentation(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DefaultApproachHeader(
            title: 'Yay! Deu tudo certo',
            description: 'Sua alteração já foi feita, aproveite.'),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(
            Icons.check_circle,
            color: kLightGreen,
            size: 22,
          ),
          const SizedBox(width: 5),
          Text(
            action == PlanAction.create
                ? 'O plano foi criado com sucesso!'
                : action == PlanAction.edit
                    ? 'O plano foi editado com sucesso!'
                    : 'O plano foi excluído com sucesso!',
            style: const TextStyle(color: kLightGreen, fontSize: 16),
          ),
        ])
      ],
    );
  }
}
