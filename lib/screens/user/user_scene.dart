import 'package:apollo/constants/globals.dart';
import 'package:apollo/models/mics/navigation_bar_item.dart';
import 'package:apollo/utils/route_utils.dart';
import 'package:apollo/widgets/containers/custom_navigation_bar.dart';
import 'package:apollo/widgets/containers/default_screen_with_header.dart';
import 'package:flutter/material.dart';

class UserScene extends StatefulWidget {
  const UserScene({Key? key}) : super(key: key);

  @override
  State<UserScene> createState() => _UserSceneState();
}

class _UserSceneState extends State<UserScene> {
  int _selectedIndex = 2;

  List<NavigationBarItem> _navigationBarItems() {
    return [
      NavigationBarItem(
        icon: Icons.bar_chart_sharp,
        title: 'Estatísticas',
        route: '',
      ),
      NavigationBarItem(
        icon: Icons.star_outline,
        title: 'Assinaturas',
        route: '',
      ),
      NavigationBarItem(
          icon: Icons.storefront,
          title: 'Início',
          route: 'home_user',
          isHome: true),
      NavigationBarItem(
        icon: Icons.edit_calendar,
        title: 'Sua agenda',
        route: '',
      ),
      NavigationBarItem(
        icon: Icons.face,
        title: 'Você',
        route: '',
      )
    ];
  }

  void onChangeTab(ChangeTagAction action, int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreenWithHeader(
      onChangeTab: onChangeTab,
      account: GLOBAL_ACCOUNT,
      navBarItems: _navigationBarItems(),
      child: RouteUtils.renderPage(_navigationBarItems()[_selectedIndex].route),
    );
  }
}
