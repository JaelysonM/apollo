import 'package:apollo/constants/globals.dart';
import 'package:apollo/modals/auth/identify_approach.dart';
import 'package:apollo/screens/home/home_logged_out.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:flutter/material.dart';

// Create a Router
class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: HomeLoggedOut(),
                ));
      case 'subscription':
        return MaterialPageRoute(builder: (_) => HomeLoggedOut());
    }
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
  }
}

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
