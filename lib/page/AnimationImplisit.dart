import 'dart:math';

import 'package:flutter/material.dart';

double randomBorderRadius() {
  return Random().nextDouble() * 50;
}

double randomMargin() {
  return Random().nextDouble() * 400;
}

int randomOpasity() {
  return Random().nextInt(255);
}

class Animationimplisit extends StatefulWidget {
  const Animationimplisit({super.key});

  @override
  State<Animationimplisit> createState() => _AnimationimplisitState();
}

class _AnimationimplisitState extends State<Animationimplisit> {
  late double borderRadius;
  late double margin;
  late int opasity;

  int begin = 100;
  int last = 100;

  @override
  void initState() {
    // TODO: implement initState
    margin = randomMargin();
    borderRadius = randomBorderRadius();
    opasity = randomOpasity();

    super.initState();
  }

  void changeValue() {
    setState(() {
      margin = randomMargin();
      borderRadius = randomBorderRadius();
      opasity = randomOpasity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                width: 100,
                height: 100,
                margin: EdgeInsets.only(bottom: margin, top: 400-margin),
                decoration: BoxDecoration(
                  color: Color.fromARGB(opasity, 65, 195, 255),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              TextButton(
                onPressed: () {
                  changeValue();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.lightBlueAccent),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                child: Text("Ubah"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
