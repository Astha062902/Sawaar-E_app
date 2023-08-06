import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:signup_login/WelcomeScreen_d.dart';
import 'WelcomeScreen_d.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // useMaterial3: true;
        fontFamily: ('inter'),
      ),
      home: const WelcomeScreen(),
    );
  }
}
