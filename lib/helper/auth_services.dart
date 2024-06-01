import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/helper/firebase_services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential?> signUpWithEmailPassword(
    BuildContext context,
    String name,
    String email,
    String password,
  ) async {
    try {
      // Create User in Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update displayname in Firebase
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);

      // Save User to FireStore
      await FirebaseServices.saveUser(name, email, userCredential.user!.uid);

      // FeedBack Snackbar Registration user is Successfully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Registration Successfully'),
        ),
      );

      // Navigate to Auth Gate
      Navigator.of(context).pushNamed('/nav');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // if Passward is week, then give feedback use Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('The password provided is too weak.'),
          ),
        );

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // if email is already in user, then give feedback use Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('The account already exists for that email.'),
          ),
        );

        print('The account already exists for that email.');
      }
    } catch (e) {
      // if proses have error, then give feedback use Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            e.toString(),
          ),
        ),
      );
      print(e);
    }
  }

  static Future<UserCredential?> signInWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      // Login Firebase Auth with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // FeedBack Snackbar Login user is Successfully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login Successfully'),
        ),
      );

      // Navigate to auth gate
      Navigator.of(context).pushNamed('/nav');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // if User Not Found, then send Feedback user snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Login Failed, you don't have an account"),
          ),
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Login Failed, Please Try Again"),
          ),
        );
        print('Wrong password provided for that user.');
      } 
      print(e.code);
    } catch (e) {
      // if proses have error, then give feedback use Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            e.toString(),
          ),
        ),
      );
      print(e);
    }
  }

  static signOut(BuildContext context) async {
    // Log out from Authentication Firebase
    await FirebaseAuth.instance.signOut();

    // send Feedback Log out was Successfully
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Log out successfully",
        ),
      ),
    );

    Navigator.of(context).pushNamed('/nav');
  }
}
