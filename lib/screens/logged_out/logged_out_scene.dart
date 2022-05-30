import 'package:apollo/constants/colors.dart';
import 'package:apollo/models/mics/navigation_bar_item.dart';
import 'package:apollo/utils/route_utils.dart';
import 'package:apollo/widgets/containers/custom_navigation_bar.dart';
import 'package:apollo/widgets/containers/default_screen_with_header.dart';
import 'package:flutter/material.dart';

class LoggedOutScene extends StatefulWidget {
  const LoggedOutScene({Key? key}) : super(key: key);

  @override
  State<LoggedOutScene> createState() => _LoggedOutSceneState();
}

class _LoggedOutSceneState extends State<LoggedOutScene> {
  int _selectedIndex = 1;

  List<NavigationBarItem> _navigationBarItems() {
    return [
      NavigationBarItem(
        icon: Icons.star_outline,
        title: 'Assinaturas',
        route: 'subscriptions_logged_out',
      ),
      NavigationBarItem(
          icon: Icons.storefront,
          title: 'Início',
          route: 'home_logged_out',
          isHome: true),
      NavigationBarItem(
        icon: Icons.edit_calendar,
        title: 'Sua agenda',
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
      navBarItems: _navigationBarItems(),
      child: RouteUtils.renderPage(_navigationBarItems()[_selectedIndex].route),
    );
  }
}
