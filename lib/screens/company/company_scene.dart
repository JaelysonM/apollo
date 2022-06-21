import 'package:apollo/models/mics/navigation_bar_item.dart';
import 'package:apollo/services/auth_service.dart';
import 'package:apollo/shared/utils/route_utils.dart';
import 'package:apollo/widgets/containers/custom_navigation_bar.dart';
import 'package:apollo/widgets/containers/default_screen_with_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyScene extends StatefulWidget {
  const CompanyScene({Key? key}) : super(key: key);

  @override
  State<CompanyScene> createState() => _CompanySceneState();
}

class _CompanySceneState extends State<CompanyScene> {
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
        route: 'plans_company',
      ),
      NavigationBarItem(
          icon: Icons.storefront,
          title: 'Início',
          route: 'home_company',
          isHome: true),
      NavigationBarItem(
        icon: Icons.edit_calendar,
        title: 'Sua agenda',
        route: '',
      ),
      NavigationBarItem(
        icon: Icons.face,
        title: 'Sua empresa',
        route: 'profile_user',
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
    AuthService auth = Provider.of<AuthService>(context);
    return DefaultScreenWithHeader(
      onChangeTab: onChangeTab,
      account: auth.account,
      navBarItems: _navigationBarItems(),
      child: RouteUtils.renderPage(_navigationBarItems()[_selectedIndex].route),
    );
  }
}
