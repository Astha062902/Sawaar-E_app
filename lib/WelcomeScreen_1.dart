import 'package:flutter/material.dart';
// import 'package:untitled3/regScreen.dart';
// import 'loginScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       height: double.infinity,
       width: double.infinity,
       decoration: const BoxDecoration(
        //color: Color.fromARGB(255, 80, 80, 80),
         gradient: LinearGradient(
           colors: [ 
            Color(0xffE65100),
            Color(0xff281537),
           ]
         )
       ),
       child: Column(
         children: [
           const Padding(
             padding: EdgeInsets.only(top: 120.0),
            child: SizedBox(
        width: 200, // Set the desired width
        height: 200, // Set the desired height
        child: ClipOval(
          child: Image(image: AssetImage('assets/logoesawar.png')),
        ),
      ),
             //child: Image(image: AssetImage('assets/logoesawar.png')),
           ),
           const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Sawaar - E',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
           const SizedBox(
             height: 100,
           ),
           //const Text('Sawaar - E',style: TextStyle(
            // fontSize: 30,
            // color: Colors.white
          // ),),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(child: Text('DRIVER',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),),
            ),
          ),
           const SizedBox(height: 30,),
           GestureDetector(
             onTap: (){
             },
             child: Container(
               height: 53,
               width: 320,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(30),
                 border: Border.all(color: Colors.white),
               ),
               child: const Center(child: Text('RIDER',style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.black
               ),),),
             ),
           ),
          ]
       ),
     ),

    );
  }
}