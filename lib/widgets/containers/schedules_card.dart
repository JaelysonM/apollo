import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/default_info_card.dart';
import 'package:apollo/widgets/elements/mixed_text.dart';
import 'package:flutter/material.dart';

class SchedulesCard extends StatelessWidget {
  final int schedules;
  final int schedulesPercentage;

  const SchedulesCard(
      {Key? key, required this.schedules, required this.schedulesPercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultInfoCard(
      maxWidth: 180,
      backgroundColor: kSystemLightBlue2,
      children: [
        const Text('Agendados',
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
                    text: '$schedules ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '${schedules > 1 ? 'serviços' : 'serviço'}'),
              ], size: 18, color: Colors.white),
            ),
            Expanded(
              child: Text("+$schedulesPercentage%",
                  style: const TextStyle(fontSize: 8, color: kLightGreen)),
            )
          ],
        )
      ],
    );
  }
}
