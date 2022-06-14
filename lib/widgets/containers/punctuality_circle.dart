import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PunctualityCircle extends StatelessWidget {
  final double punctuality;
  final double lastPunctuality;

  const PunctualityCircle(
      {Key? key, required this.punctuality, required this.lastPunctuality})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 8.0,
          percent: punctuality / 100,
          center: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (punctuality != lastPunctuality)
                (punctuality >= lastPunctuality
                    ? const Icon(Icons.keyboard_arrow_up, color: kLightGreen)
                    : const Icon(Icons.keyboard_arrow_down, color: kErrorRed)),
              Text('${punctuality.toInt()}%',
                  style: const TextStyle(fontSize: 25, color: Colors.white))
            ],
          ),
          progressColor: kNavSeparatorBackground,
          reverse: true,
        ),
        const SizedBox(
          height: 8,
        ),
        const Text('Pontualidade',
            style: TextStyle(fontSize: 12, color: Colors.white)),
      ],
    );
  }
}
