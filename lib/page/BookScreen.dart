import 'package:flutter/material.dart';
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Verticaldrag();
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Text("Vertical Drag"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Horizontaldrag();
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Text("Horizontal Drag"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Pandrag();
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Text("Pan Drag"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
