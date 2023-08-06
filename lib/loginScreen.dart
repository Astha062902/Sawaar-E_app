// ignore: file_names
import 'package:flutter/material.dart';
import 'regScreen.dart'; // Import the RegScreen class
class PasswordTextField extends StatefulWidget {
  final String labelText;
  final Icon suffixIcon;
  final void Function()? suffixIconOnPressed;

  const PasswordTextField({
    Key? key,
    required this.labelText,
    required this.suffixIcon,
    this.suffixIconOnPressed,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: widget.suffixIconOnPressed ?? _toggleObscureText,
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xffE65100),
          ),
        ),
      ),
    );
  }
}
// ignore: camel_case_types
class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            //color:Color.fromARGB(255, 80, 80, 80),
            gradient: LinearGradient(colors: [
              Color(0xffE65100),
              Color(0xff281537),
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              'Hello\nSign in!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child:  Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.check,color: Colors.grey,),
                      label: Text('User Name ',style: TextStyle( //username intead of gmail....
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 234, 20, 63),
                      ),)
                    ),
                  ),

                  const PasswordTextField(
                        labelText: 'Create Password',
                        suffixIcon: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        ),
                      ),
                      
                  const SizedBox(height: 20,),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password?',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xff281537),
                    ),),
                  ),
                  const SizedBox(height: 70,),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xffE65100),
                                Color(0xff281537),
                              ]
                          ),
                          
                        ),
                    child: const Center(child: Text('SIGN IN',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                    ),),
                    ),
                  ),
                ),
              ),
                  const SizedBox(height: 150,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegScreen()),
                          );
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegScreen()),
                            );
                          },
                          child: const Text(
                            "Don't have an account ? \n        Create One",
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
              )
  )
  )
  )
  ]
  )
  );
  }
}


