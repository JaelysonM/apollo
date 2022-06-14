import 'package:apollo/models/account.dart';
import 'package:apollo/models/mics/navigation_bar_item.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/containers/custom_navigation_bar.dart';
import 'package:apollo/widgets/containers/default_scaffold.dart';
import 'package:apollo/widgets/containers/top_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultScreenWithHeader extends StatelessWidget {
  final Account? account;

  final List<NavigationBarItem>? navBarItems;
  final bool showDate;
  final Widget? child;
  final Function(ChangeTagAction action, int index)? onChangeTab;

  const DefaultScreenWithHeader({
    Key? key,
    this.showDate = true,
    this.account,
    this.child,
    this.navBarItems,
    this.onChangeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        navBarItems: navBarItems,
        onChangeTab: onChangeTab,
        appBar: TopHeader(account: account),
        child: Column(
          children: [
            Expanded(
              child: RawScrollbar(
                  thumbColor: kThumbColor,
                  thickness: 6,
                  radius: const Radius.circular(25),
                  child: SingleChildScrollView(
                    child: child,
                  )),
            )
          ],
        ));
  }
}
