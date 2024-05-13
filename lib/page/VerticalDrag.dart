import 'dart:math';

import 'package:flutter/material.dart';

class Verticaldrag extends StatefulWidget {
  const Verticaldrag({super.key});

  @override
  State<Verticaldrag> createState() => _VerticaldragState();
}

class _VerticaldragState extends State<Verticaldrag> {
  double _boxSize = 150;

  double _posX = 0;
  double _posY = 0;

  @override
  Widget build(BuildContext context) {
    if (_posX == 0 && _posY == 0) {
      centerContainer();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            top: _posY,
            left: _posX,
            child: GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                double verticalPosition = details.delta.dy;
                setState(() {
                    _posY = max(0, _posY + verticalPosition);
                  });
              },
              child: Container(
                width: _boxSize,
                height: _boxSize,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void centerContainer() {
    setState(() {
      _posY = (MediaQuery.of(context).size.height - _boxSize) / 2 - 90;
      _posX = (MediaQuery.of(context).size.width - _boxSize) / 2;
    });
  }
}
