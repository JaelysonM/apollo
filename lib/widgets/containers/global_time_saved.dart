import 'package:apollo/widgets/containers/default_info_card.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:flutter/material.dart';

class GlobalTimeSavedCard extends StatelessWidget {
  final int savingTime;
  final int savingTimePercentage;

  const GlobalTimeSavedCard(
      {Key? key, required this.savingTime, required this.savingTimePercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultInfoCard(
      children: [
        MixedText(
          [
            TextSpan(
                text: "$savingTime min",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const TextSpan(text: ' foram economizados até agora'),
          ],
          size: 16,
        ),
        const SizedBox(height: 5),
        MixedText(
          [
            TextSpan(
                text: '+${savingTimePercentage.floor()}%',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.greenAccent)),
            const TextSpan(
                text: ' em relação a semana passada',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
          size: 10,
        ),
      ],
    );
  }
}
