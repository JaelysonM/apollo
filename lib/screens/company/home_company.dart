import 'package:apollo/models/account.dart';
import 'package:apollo/models/company_account.dart';
import 'package:apollo/models/product.dart';
import 'package:apollo/services/auth_service.dart';
import 'package:apollo/widgets/containers/my_products.dart';
import 'package:apollo/widgets/containers/schedules_card.dart';
import 'package:apollo/widgets/containers/screen_header_container.dart';
import 'package:apollo/widgets/containers/time_saved_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCompany extends StatelessWidget {
  const HomeCompany({Key? key}) : super(key: key);

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
    return Column(
      children: [
        const ScreenHeader(
          showDate: true,
        ),
        MyProducts(products: [
          Product(
              company: account! as CompanyAccount,
              name: 'Barba',
              description: 'Product 1 description',
              duration: 60,
              id: '1',
              price: 100),
          Product(
              company: account as CompanyAccount,
              name: 'Cabelo',
              description: 'Product 1 description',
              duration: 160,
              id: '1',
              price: 100),
          Product(
              company: account,
              name: 'Unha',
              description: 'Product 1 description',
              duration: 180,
              id: '1',
              price: 100),
        ])
      ],
    );
  }
}
