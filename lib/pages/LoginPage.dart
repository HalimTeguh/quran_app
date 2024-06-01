import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/input_text.dart';
import '../helper/auth_services.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  double _topPositionImage = 0;
  double _opacityImage = 1;
  double _bottomPositionContainer = -1000;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _topPositionImage = -300; // Ubah posisi gambar setelah delay
        _opacityImage = 0.8;
      });
    });

    Future.delayed(Duration(milliseconds: 1700), () {
      setState(() {
        _bottomPositionContainer = 0; // Ubah posisi gambar setelah delay
      });
    });
  }

  void signInEmailPassword() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.deepPurpleAccent,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 900),
            curve: Curves.easeOutSine,
            top: _topPositionImage,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _opacityImage,
              duration: Duration(milliseconds: 500),
              child: Image.asset(
                'public/images/login_image.jpg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeOutSine,
            bottom: _bottomPositionContainer,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(40),
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        // Login Text
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                    
                        SizedBox(
                          height: 30,
                        ),
                    
                        // TextField UserName
                        InputText(
                          controller: _emailController,
                          labelText: "Email",
                          hintText: "your email...",
                          validator: (value) {
                            // email cannot be null
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                    
                            // email must contain '@'
                            if (!value.contains('@')) {
                              return "Email must contain '@'";
                            }
                    
                            return null;
                          },
                        ),
                    
                        SizedBox(
                          height: 20,
                        ),
                    
                        // TextField Password
                        InputText(
                          controller: _passwordController,
                          labelText: "Password",
                          hintText: "your password...",
                          inputType: TextInputType.visiblePassword,
                          validator: (value) {
                            // password cannot be null
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                    
                            if (value.length <= 4) {
                              return 'Password must more than 4 Character';
                            }
                    
                            return null;
                          },
                        ),
                    
                        SizedBox(
                          height: 30,
                        ),
                    
                        // Button for Login
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () async {

                              if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    await AuthServices.signInWithEmailAndPassword(
                                      context,
                                      _emailController.text,
                                      _passwordController.text,
                                    );
                                  }
                              
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.deepPurpleAccent),
                                overlayColor:
                                    MaterialStatePropertyAll(Colors.white12),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)))),
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                    
                        SizedBox(
                          height: 20,
                        ),
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(fontSize: 12),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/registration');
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  shadows: [
                                    Shadow(
                                        offset: Offset(0, -2),
                                        color: Colors.deepPurpleAccent)
                                  ],
                                  decorationThickness: 2,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Button for Signup
                    
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  // Divider and Sign in with Google

                  Column(
                    children: [
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.black26),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(12)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // logo Google
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'public/icons/google_logo.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),

                              // Text Login with Google
                              Text(
                                "Sign in with Google",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
