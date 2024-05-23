import 'package:flutter/material.dart';
import 'package:quran_app/pages/HomeScreen.dart';
import 'package:quran_app/pages/LoginPage.dart';
import 'package:quran_app/pages/Navigation.dart';
import 'package:quran_app/pages/SurahScreen.dart';
import 'package:quran_app/pages/splash.dart';

void main() {
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
        '/registrasi': (context) => const Loginpage(),



        '/nav': (context) => const Navigation(),
        '/homePage': (context) => const HomeScreen(),
        '/detailSurah': (context) => const Surahscreen(),
        // '/surah': (context) => const SurahScreen(),
      },
    );
  }
}
