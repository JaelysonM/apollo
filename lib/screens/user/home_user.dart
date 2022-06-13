import 'package:apollo/shared/constants/globals.dart';
import 'package:apollo/widgets/containers/catalog.dart';
import 'package:apollo/widgets/containers/punctuality_circle.dart';
import 'package:apollo/widgets/containers/schedules_card.dart';
import 'package:apollo/widgets/containers/screen_header_container.dart';
import 'package:apollo/widgets/containers/time_saved_card.dart';
import 'package:flutter/material.dart';

class HomeUser extends StatelessWidget {
  const HomeUser({Key? key}) : super(key: key);

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
      children: [
        ScreenHeader(
            showDate: true,
            child: PunctualityCircle(
              punctuality: 100,
              lastPunctuality: 100,
            )),
        _renderStatistics(),
        const SizedBox(
          height: 10,
        ),
        Catalog(
          tags: COMPANY_TAGS,
          companies: [],
        ),
      ],
    );
  }
}
