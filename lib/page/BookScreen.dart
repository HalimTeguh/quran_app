import 'package:flutter/material.dart';
import 'package:quran_app/page/AnimationImplisit.dart';
import 'package:quran_app/page/Challenge29.dart';
import 'package:quran_app/page/HorizontalDrag.dart';
import 'package:quran_app/page/PanDrag.dart';
import 'package:quran_app/page/VerticalDrag.dart';

class Bookscreen extends StatefulWidget {
  const Bookscreen({super.key});

  @override
  State<Bookscreen> createState() => _BookscreenState();
}

class _BookscreenState extends State<Bookscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
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
