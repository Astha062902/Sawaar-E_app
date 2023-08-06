import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'HomePage.dart';
import 'WelcomeScreen.dart';
import 'main.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: ('inter'),
        useMaterial3: true,
      ),
      /// new code for converting images to button with link
      // routes: {
      //   '/home': (context) => const HomePage(), // Define the named route
      // },
      home:const WelcomeScreen(),
    );
  }
}