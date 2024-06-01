import 'package:flutter/material.dart';

import '../components/input_text.dart';
import '../helper/auth_services.dart';

class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  double _topPositionImage = 0;
  double _opacityImage = 1;
  double _bottomPositionContainer = -1000;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Login Text
                            Text(
                              "Registration",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            // TextField UserName
                            InputText(
                              controller: _nameController,
                              labelText: "Name",
                              hintText: "your name...",
                              validator: (value) {
                                // email cannot be null
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            // TextField Email
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
                              height: 10,
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
                              height: 10,
                            ),

                            // TextField Confirm Password
                            InputText(
                              controller: _confirmPasswordController,
                              labelText: "Confirm Password",
                              hintText: "confirm your password...",
                              inputType: TextInputType.visiblePassword,
                              validator: (value) {
                                // password cannot be null
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }

                                if (value.length <= 4) {
                                  return 'Password must more than 4 Character';
                                }

                                if (value != _passwordController.text) {
                                  return 'Password not match';
                                }

                                return null;
                              },
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            // Button for Register
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    await AuthServices.signUpWithEmailPassword(
                                      context,
                                      _nameController.text,
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
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed('/login');
                                  },
                                  child: Text(
                                    "Login",
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
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () async {},
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStatePropertyAll(Colors.black26),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
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
                                    "Sign up with Google",
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
