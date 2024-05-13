import 'dart:math';

import 'package:flutter/material.dart';

class Pandrag extends StatefulWidget {
  const Pandrag({super.key});

  @override
  State<Pandrag> createState() => _PandragState();
}

class _PandragState extends State<Pandrag> {
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
              onPanUpdate: (DragUpdateDetails details) {
                double verticalPosition = details.delta.dy;
                double horizontalPosition = details.delta.dx;
                setState(() {
                  _posY = max(0, _posY + verticalPosition);
                  _posX = max(0, _posX + horizontalPosition);
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
