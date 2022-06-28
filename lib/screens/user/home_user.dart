import 'package:apollo/models/account.dart';
import 'package:apollo/models/company_account.dart';
import 'package:apollo/services/auth_service.dart';
import 'package:apollo/shared/constants/globals.dart';
import 'package:apollo/widgets/containers/catalog.dart';
import 'package:apollo/widgets/containers/punctuality_circle.dart';
import 'package:apollo/widgets/containers/schedules_card.dart';
import 'package:apollo/widgets/containers/screen_header_container.dart';
import 'package:apollo/widgets/containers/time_saved_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    AuthService authService = Provider.of<AuthService>(context);
    Account? account = authService.account;

    List<CompanyAccount> companies = [
      CompanyAccount.create('234234234234234', {
        'name': 'Barberia Felype',
        'email': 'jaelysonmartins@gmail.com',
        'image_url': 'https://i.imgur.com/GhY98W6.jpg'
      })
    ];

    return Column(
      children: [
        ScreenHeader(
            showDate: true,
            child: PunctualityCircle(
              punctuality: account?.punctuality ?? 100,
              lastPunctuality: account?.lastPunctuality ?? 100,
            )),
        _renderStatistics(),
        const SizedBox(
          height: 10,
        ),
        Catalog(tags: COMPANY_TAGS),
      ],
    );
  }
}
