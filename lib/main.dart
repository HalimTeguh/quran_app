import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/firebase_options.dart';
import 'package:quran_app/pages/HomeScreen.dart';
import 'package:quran_app/pages/LoginPage.dart';
import 'package:quran_app/pages/Navigation.dart';
import 'package:quran_app/pages/RegistrationPage.dart';
import 'package:quran_app/pages/SurahScreen.dart';
import 'package:quran_app/pages/auth_page.dart';
import 'package:quran_app/pages/challenge_page.dart';
import 'package:quran_app/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Poppins"
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Loginpage(),
        '/registration': (context) => const Registrationpage(),
        '/auth': (context) => const AuthPage(),
        '/challenge': (context) => ChallengePage(),


        '/nav': (context) => const Navigation(),
        '/homePage': (context) => const HomeScreen(),
        // '/detailSurah': (context) => const Surahscreen(),
        // '/surah': (context) => const SurahScreen(),
      },
    );
  }
}
