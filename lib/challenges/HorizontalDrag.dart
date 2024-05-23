
import 'dart:math';

import 'package:flutter/material.dart';

class Horizontaldrag extends StatefulWidget {
  const Horizontaldrag({super.key});

  @override
  State<Horizontaldrag> createState() => _HorizontaldragState();
}

class _HorizontaldragState extends State<Horizontaldrag> {
  double _boxSize = 150;

  double _posX = 0;
  double _posY = 0;
  
  @override
  Widget build(BuildContext context) {
    if(_posX == 0 && _posY == 0){
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
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                double horizontalPosition = details.delta.dx;
                setState(() {
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
