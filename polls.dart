import 'package:flutter/material.dart';

class Polls extends StatelessWidget {
  const Polls({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongoing Polls',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        backgroundColor: Colors.orange[900],
        centerTitle: true,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300, // Adjust the width as needed
            height: 50, // Adjust the height as needed
            decoration: BoxDecoration(
              color: Colors.orange[100], // Background color of the box
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: TextButton(
              onPressed: () {
                // Add your TextButton click logic here
                print('TextButton clicked!');
              },
              child: Text(
                'DESTINATION- AZADPUR-> ASHOK VIHAR',
                style: TextStyle(color: Colors.black), // Text color
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add your first button click logic here
                  print('First Elevated button clicked!');
                },
                child: Text('DECLINE'),
              ),
              SizedBox(width: 16), // Add some space between the buttons
              ElevatedButton(
                onPressed: () {
                  // Add your second button click logic here
                  print('Second Elevated button clicked!');
                },
                child: Text('ACCEPT'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
