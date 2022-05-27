import 'package:apollo/constants/globals.dart';
import 'package:apollo/screens/home/home_logged_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Apollo',
      navigatorKey: GlobalVariable.navState,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeLoggedOut(),
      },
      initialRoute: '/',
    );
  }
}
