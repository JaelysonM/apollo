import 'package:apollo/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DynamicBottomModal {
  static void showModal(BuildContext context, Widget child) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: kThemeBackground,
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      height: 4,
                      width: 50,
                      margin: const EdgeInsets.only(top: 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child,
                ],
              ),
            ));
  }
}
