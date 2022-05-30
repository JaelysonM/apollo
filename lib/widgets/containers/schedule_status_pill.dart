import 'package:apollo/models/schedule.dart';
import 'package:apollo/widgets/styles/default_bold_text.dart';
import 'package:flutter/material.dart';

class ScheduleStatusPill extends StatelessWidget {
  final ScheduleStatus status;
  const ScheduleStatusPill({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: DefaultBoldText(
              content: getScheduleStatusLabel(status), fontSize: 8)),
      color: getColorFromScheduleStatus(status),
    );
  }
}
