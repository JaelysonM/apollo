import 'package:apollo/models/mics/navigation_bar_item.dart';
import 'package:apollo/widgets/containers/catalog.dart';
import 'package:apollo/widgets/containers/default_info_card.dart';
import 'package:apollo/widgets/containers/default_screen_with_header.dart';
import 'package:apollo/widgets/containers/what_you_need.dart';
import 'package:flutter/material.dart';

class HomeLoggedOut extends StatefulWidget {
  const HomeLoggedOut({Key? key}) : super(key: key);

  @override
  State<HomeLoggedOut> createState() => _HomeLoggedOutState();
}

class _HomeLoggedOutState extends State<HomeLoggedOut> {
  List<NavigationBarItem> _navigationBarItems() {
    return [
      NavigationBarItem(
        icon: Icons.star_outline,
        title: 'Assinaturas',
        route: 'subscription',
      ),
      NavigationBarItem(
          icon: Icons.storefront, title: 'Início', route: 'home', isHome: true),
      NavigationBarItem(
        icon: Icons.edit_calendar,
        title: 'Sua agenda',
        route: '',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreenWithHeader(
      headerChild: DefaultInfoCard(savingTime: 50, savingTimePercentage: 99),
      navBarItems: _navigationBarItems(),
      children: [
        SizedBox(
          height: 10,
        ),
        WhatYouNeed(),
        SizedBox(
          height: 10,
        ),
        Catalog(),
      ],
    );
  }
}
