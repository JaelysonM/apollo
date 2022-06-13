import 'package:apollo/models/mics/navigation_bar_item.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Function(ChangeTagAction action, int index)? onChangeTab;

  final List<NavigationBarItem>? navBarItems;
  const DefaultScaffold(
      {Key? key,
      required this.child,
      this.navBarItems,
      this.appBar,
      required this.onChangeTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        backgroundColor: kThemeBackground,
        body: SafeArea(
            child: child, bottom: false, maintainBottomViewPadding: true),
        extendBody: true,
        bottomNavigationBar: navBarItems != null
            ? CustomNavigationBar(
                items: navBarItems ?? [],
                onChangeTab: onChangeTab,
              )
            : null);
  }
}
