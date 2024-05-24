import 'package:flutter/material.dart';

import '../challenges/AnimationImplisit.dart';
import '../challenges/Challenge29.dart';
import '../challenges/Challenge31.dart';
import '../challenges/HorizontalDrag.dart';
import '../challenges/PanDrag.dart';
import '../challenges/VerticalDrag.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPage(
                  title: "Vertical Drag",
                  page: Verticaldrag(),
                ),
                ButtonPage(
                  title: "Horizontal Drag",
                  page: Horizontaldrag(),
                ),
                ButtonPage(
                  title: "Pan Drag",
                  page: Pandrag(),
                ),
                ButtonPage(
                  title: "Implisit Animation",
                  page: Animationimplisit(),
                ),
                ButtonPage(
                  title: "Pertemuan 29: MiniChallenge",
                  page: Challenge29(),
                ),
                ButtonPage(
                  title: "Pertemuan 31: MiniChallenge",
                  page: Challenge31(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ButtonPage extends StatelessWidget {
  const ButtonPage({
    super.key,
    required this.title,
    required this.page,
  });
  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return page;
              },
            ),
          );
        },
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
            backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
            foregroundColor: MaterialStateProperty.all(Colors.white)),
        child: Text(title),
      ),
    );
  }
}
