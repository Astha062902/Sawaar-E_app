import 'package:chatroom_app/regScreen.dart';
import 'package:flutter/material.dart';
//import 'package:untitled3/regScreen.dart';
import 'loginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffE65100),
          Color(0xff281537),
        ])),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 120.0),
            child: SizedBox(
              width: 140, // Set the desired width
              height: 140, // Set the desired height
              child: ClipOval(
                child: Image(image: AssetImage('assets/logoesawaar.png')),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Sawaar - E',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const loginScreen()));
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RegScreen()));
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          const Spacer(),
          /*const Text('Login with Social Media',style: TextStyle(
               fontSize: 17,
               color: Colors.white
           ),),//
          const SizedBox(height: 12,),
           const Image(image: AssetImage('assets/social.png'))*/
        ]),
      ),
    );
  }
}
