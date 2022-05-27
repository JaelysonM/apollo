import 'package:apollo/constants/globals.dart';
import 'package:apollo/modals/auth/identify_approach.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static String getRouteName(String route) {
    if (route.contains('/')) {
      return route.split('/')[1];
    }
    return route;
  }

  static void popupIdentifyModal(BuildContext? context) {
    if (context == null) {
      MutableModalContent.showModal(
          GlobalVariable.navState.currentContext!, const IdentifyApproach());
    } else {
      MutableModalContent.showModal(context, const IdentifyApproach());
    }
  }
}
