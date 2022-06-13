import 'package:apollo/shared/constants/globals.dart';
import 'package:apollo/widgets/containers/catalog.dart';
import 'package:apollo/widgets/containers/global_time_saved.dart';
import 'package:apollo/widgets/containers/screen_header_container.dart';
import 'package:apollo/widgets/containers/what_you_need.dart';
import 'package:flutter/widgets.dart';

class HomeLoggedOut extends StatelessWidget {
  const HomeLoggedOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScreenHeader(
          showDate: true,
          child: GlobalTimeSavedCard(savingTime: 50, savingTimePercentage: 99),
        ),
        const SizedBox(
          height: 10,
        ),
        const WhatYouNeed(),
        const SizedBox(
          height: 10,
        ),
        Catalog(
          tags: COMPANY_TAGS,
          companies: const [],
        ),
      ],
    );
  }
}
