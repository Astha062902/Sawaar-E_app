// ignore: file_names
import 'package:flutter/material.dart';
import 'loginScreen.dart'; // Import the loginScreen class

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

class RegScreen extends StatelessWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Stack(//thanks for watching
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                              colors: [
                                Color(0xffE65100),
                                Color(0xff281537),
                              ]
                          ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Create Your\nAccount',
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
                            label: Text('Full Name',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color(0xffE65100),
                            ),)
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.check,color: Colors.grey,),
                            label: Text('Phone Number ',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Color(0xffE65100),
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
                      const PasswordTextField(
                        labelText: 'Confirm Password',
                        suffixIcon: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        ),
                      ),
                      
                      const SizedBox(height: 10,),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const loginScreen()),
                           );
                          },
                        child: 
                          Container(
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
                        child: const Center(child: Text('Create Account',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                        ),),),
                        ),
                      ),
                      const SizedBox(height: 150,),
                  Align(
                    alignment: Alignment.bottomRight,
                      child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const loginScreen()));
                            },

                            child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const loginScreen()),
                            );
                          },
                            child: const Text(
                              "Already have an account? \n           sign in ",
                              style: TextStyle(

                                  ///done login page
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                            ),
                            ],
                          ),
                  ),
                  ),
               ],
                  ),
                  ),
                ),
              ),
          ],
        ),
        );
  }
}
                      
                      
                      
                      
                      
                      /*const Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Don't have account?",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),),
                            Text("Sign up",style: TextStyle(///done login page
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black
                            ),),
                          ],
                        ),
                       }*/
