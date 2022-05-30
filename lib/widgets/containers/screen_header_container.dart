import 'package:flutter/material.dart';
import 'current_date_container.dart';

class ScreenHeader extends StatelessWidget {
  final Widget? child;
  final bool showDate;
  const ScreenHeader({Key? key, this.child, this.showDate = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        child: Column(
          children: [
            if (showDate) ...[
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CurrentDateContainer(),
                      if (child != null) ...[
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(left: 10),
                          child: child,
                        ))
                      ]
                    ],
                  ))
            ]
          ],
        ));
  }
}
