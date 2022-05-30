import 'package:apollo/widgets/containers/last_schedules.dart';
import 'package:apollo/widgets/containers/schedules_card.dart';

import 'package:apollo/widgets/containers/time_saved_card.dart';
import 'package:apollo/widgets/containers/user_geral_section.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({Key? key}) : super(key: key);

  Widget _renderStatistics() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            TimeSavedCard(
              savingTime: 650,
              savingTimeOffset: 25,
            ),
            SchedulesCard(
              schedules: 9,
              schedulesPercentage: 10,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LastSchedules(),
        SizedBox(height: 20),
        UserGeralSection()
      ],
    );
  }
}
