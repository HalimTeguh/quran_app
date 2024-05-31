import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/pages/LoginPage.dart';
import 'package:quran_app/pages/Navigation.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // if user logged in
          print(snapshot.hasData);
          return Navigation();
        } else {
          // if user Not logged in
          print(snapshot.hasData);
          return Loginpage();
        }
      },
    );
  }
}
