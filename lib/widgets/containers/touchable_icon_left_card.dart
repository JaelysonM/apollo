import 'package:apollo/constants/colors.dart';
import 'package:flutter/material.dart';

class TouchableIconLeftCard extends StatelessWidget {
  final Widget child;
  final Widget icon;
  final Color? backgroundColor;
  final Function(BuildContext context)? onTap;

  const TouchableIconLeftCard(
      {Key? key,
      required this.child,
      required this.icon,
      this.backgroundColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20),
        child: Material(
            color: backgroundColor ?? kSystemLightBlue2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 150, maxHeight: 60),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      icon,
                      const SizedBox(width: 10),
                      Expanded(child: child)
                    ],
                  )),
              onTap: () {
                if (onTap != null) {
                  onTap!(context);
                }
              },
            )));
  }
}
