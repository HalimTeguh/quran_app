import 'package:flutter/material.dart';
import 'package:quran_app/page/Navigation.dart';
import 'package:quran_app/page/splash.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Poppins"
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/nav': (context) => const Navigation(),
        // '/surah': (context) => const SurahScreen(),
      },
    );
  }
}
