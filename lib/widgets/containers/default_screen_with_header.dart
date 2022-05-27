import 'package:apollo/models/account.dart';
import 'package:apollo/models/mics/navigation_bar_item.dart';
import 'package:apollo/widgets/containers/default_scaffold.dart';
import 'package:apollo/widgets/containers/screen_header_container.dart';
import 'package:apollo/widgets/containers/top_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultScreenWithHeader extends StatelessWidget {
  final Widget? headerChild;
  final Account? account;

  final List<NavigationBarItem>? navBarItems;
  final bool showDate;
  final List<Widget>? children;

  const DefaultScreenWithHeader({
    Key? key,
    this.headerChild,
    this.showDate = true,
    this.account,
    this.children,
    this.navBarItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        navBarItems: navBarItems,
        appBar: TopHeader(account: account),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ScreenHeader(
                      showDate: showDate,
                      child: headerChild,
                    ),
                    ...?children
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
