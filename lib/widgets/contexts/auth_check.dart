import 'package:apollo/screens/company/company_scene.dart';
import 'package:apollo/screens/logged_out/logged_out_scene.dart';
import 'package:apollo/screens/user/user_scene.dart';
import 'package:apollo/services/auth_service.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  Widget loading() {
    return Scaffold(
        backgroundColor: kThemeBackground,
        body: Center(
            child: LoadingAnimationWidget.waveDots(
                color: kSystemPurple, size: 25)));
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading) {
      return loading();
    }
    if (auth.user == null) {
      return const LoggedOutScene();
    } else {
      if (auth.isCompany) {
        return const CompanyScene();
      } else {
        return const UserScene();
      }
    }
  }
}
