import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/time_formatter.dart';
import 'package:apollo/widgets/containers/default_info_card.dart';
import 'package:flutter/material.dart';

class TimeSavedCard extends StatelessWidget {
  final int savingTime;
  final int savingTimeOffset;

  const TimeSavedCard(
      {Key? key, required this.savingTime, required this.savingTimeOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultInfoCard(
      maxWidth: 160,
      backgroundColor: kSystemBlue2,
      children: [
        const Text('Tempo economizado',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.white)),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${TimeFormatter.formatMinutesToHhMm(savingTime)}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(width: 5),
            Expanded(
              child: Text("+$savingTimeOffset min",
                  style: const TextStyle(fontSize: 8, color: kLightGreen)),
            )
          ],
        )
      ],
    );
  }
}
