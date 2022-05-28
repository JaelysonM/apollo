import 'package:apollo/modals/auth/identify_approach.dart';
import 'package:apollo/modals/login/login_form.dart';
import 'package:apollo/modals/register/register_form.dart';
import 'package:apollo/widgets/containers/mutable_modal_content.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static void showModal(BuildContext context,
      {required String route, bool cleanHistory = false}) {
    switch (route) {
      case 'identify_approach':
        showOrPushModal(context,
            modalContent: IdentifyApproach(), cleanHistory: cleanHistory);
        break;
      case 'login':
        showOrPushModal(context,
            modalContent: LoginForm(), cleanHistory: cleanHistory);
        break;
      case 'register':
        showOrPushModal(context,
            modalContent: RegisterForm(), cleanHistory: cleanHistory);
        break;
    }
  }

  static void showOrPushModal(BuildContext context,
      {bool cleanHistory = false, required Widget modalContent}) {
    if (MutableModalContent.of(context) != null) {
      if (cleanHistory) {
        MutableModalContent.of(context).cleanLastsFromHistory();
      }
      MutableModalContent.of(context).push(modalContent);
    } else {
      MutableModalContent.showModal(context, modalContent);
    }
  }
}
