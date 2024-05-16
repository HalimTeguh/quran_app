import 'dart:math';

import 'package:flutter/material.dart';

class Challenge29 extends StatefulWidget {
  const Challenge29({super.key});

  @override
  State<Challenge29> createState() => _Challenge29State();
}

class _Challenge29State extends State<Challenge29> {
  late double borderRadius;
  late double margin;
  late Color color;

  double _boxSize = 100;

  double _x = 0;
  double _y = 0;

  @override
  void initState() {
    // TODO: implement initState
    margin = randomMargin();
    borderRadius = randomBorderRadius();
    color = randomColor();

    super.initState();
  }

  void changeValue() {
    setState(() {
      margin = randomMargin();
      borderRadius = randomBorderRadius();
      color = randomColor();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: _y,
                left: _x,
                child: GestureDetector(
                  onTap: () {
                    changeValue();
                  },
                  onPanUpdate: (details) {
                    double verticalPosition = details.delta.dy;
                    double horizontalPosition = details.delta.dx;

                    setState(() {
                      _y = max(0, _y + verticalPosition);
                      _x = max(0, _x + horizontalPosition);
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.bounceOut,
                    width: _boxSize,
                    height: _boxSize,
                    margin: EdgeInsets.only(bottom: margin, top: 400 - margin),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void centerContainer() {
    setState(() {
      _x = (MediaQuery.of(context).size.height - _boxSize) / 2 - 90;
      _y = (MediaQuery.of(context).size.width - _boxSize) / 2;
    });
  }
}

double randomBorderRadius() {
  return Random().nextDouble() * 50;
}

double randomMargin() {
  return Random().nextDouble() * 400;
}

int randomOpasity() {
  return Random().nextInt(255);
}

Color randomColor() {
  return Color.fromARGB(
      255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
}
