import 'package:apollo/constants/colors.dart';
import 'package:apollo/models/mics/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final List<NavigationBarItem> items;

  const CustomNavigationBar({Key? key, required this.items}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    for (var element in widget.items) {
      if (element.isHome) {
        _selectedIndex = widget.items.indexOf(element);
      }
    }
    super.initState();
  }

  String getItemTitle(int index) {
    return widget.items[index].title;
  }

  IconData getItemIcon(int index) {
    return widget.items[index].icon;
  }

  double getItemIconSize(int index) {
    return widget.items[index].iconSize;
  }

  Widget _renderNavigationBarItem(int index) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (index != _selectedIndex) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
                offset: Offset(0, _selectedIndex == index ? -10 : 0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? kNavSeparatorBackground
                        : null,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    getItemIcon(index),
                    size: getItemIconSize(index),
                    color: Colors.white,
                  ),
                )),
            Text(
              getItemTitle(index),
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      height: displayWidth * .155,
      decoration: BoxDecoration(
        color: kNavBarBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.items.length, (index) {
              return _renderNavigationBarItem(index);
            }),
          )),
    );
  }
}
