import 'package:apollo/constants/colors.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:flutter/material.dart';

class DefaultInfoCard extends StatelessWidget {
  final int savingTime;
  final int savingTimePercentage;

  const DefaultInfoCard(
      {Key? key, required this.savingTime, required this.savingTimePercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 210),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kInterDarkBlue,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent)),
                const TextSpan(
                    text: ' em relação a semana passada',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
              size: 10,
            ),
          ],
        ));
  }
}
