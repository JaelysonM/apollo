import 'package:apollo/shared/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/splash.dart';

class ApolloApp extends StatelessWidget {
  const ApolloApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
    ));
    return MaterialApp(
      navigatorKey: GlobalVariable.navState,
      theme: ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
