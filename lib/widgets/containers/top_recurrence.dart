import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_info_card.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:flutter/material.dart';

class TopRecurrence extends StatelessWidget {
  final String? topPlan;
  const TopRecurrence({Key? key, this.topPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultInfoCard(
      maxWidth: 200,
      backgroundColor: kLightBlue2,
      children: [
        const Text('Plano com maior recorrência',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.white)),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: MixedText([
                TextSpan(
                    text: topPlan ?? '-/-',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ], size: 18, color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
