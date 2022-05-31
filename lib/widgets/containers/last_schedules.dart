import 'package:apollo/constants/globals.dart';
import 'package:apollo/models/schedule.dart';
import 'package:apollo/models/user.dart';
import 'package:apollo/widgets/containers/schedule_card.dart';
import 'package:apollo/widgets/styles/small_section_title.dart';
import 'package:flutter/material.dart';

class LastSchedules extends StatelessWidget {
  const LastSchedules({Key? key}) : super(key: key);

  Widget _renderHorizontalView(List<Schedule> lastSchedules) {
    return ListView.builder(
        itemCount: lastSchedules.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              ScheduleCard(schedule: lastSchedules[index]),
              const SizedBox(
                width: 20,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Schedule> lastSchedules =
        (GLOBAL_ACCOUNT as User).getLastSchedules(limit: 10);
    return lastSchedules.isEmpty
        ? Container()
        : Column(
            children: [
              const SmallSectionTitle('Últimos agendamentos'),
              Padding(
                padding: const EdgeInsets.only(left: 19, top: 10),
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 65),
                    child: _renderHorizontalView(lastSchedules)),
              )
            ],
          );
  }
}
