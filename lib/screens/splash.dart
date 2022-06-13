import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/widgets/contexts/auth_check.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, anotherAnimation) {
                return const AuthCheck();
              },
              transitionDuration: const Duration(milliseconds: 1100),
              transitionsBuilder:
                  (context, animation, anotherAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeBackground,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Image.asset(
            'assets/images/logo.png',
            scale: 5,
          ),
        ),
      ),
    );
  }
}
