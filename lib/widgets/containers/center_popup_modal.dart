import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class CenterPopupModal {
  static void showModal(BuildContext context, Widget child) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kThemeBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Container(
              child: child,
            ),
          );
        });
  }
}
