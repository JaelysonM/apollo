import 'package:flutter/material.dart';

class NavigationBarItem {
  IconData icon;
  double iconSize;
  String title;
  String route;
  bool isHome;
  NavigationBarItem(
      {required this.icon,
      required this.title,
      required this.route,
      this.isHome = false,
      this.iconSize = 30});
}
