import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Accountscreen extends StatefulWidget {
  const Accountscreen({super.key});

  @override
  State<Accountscreen> createState() => _AccountscreenState();
}

class _AccountscreenState extends State<Accountscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (BuildContext context, constraint) {
        if (constraint.maxWidth < 600) {
          return ListView(
            children: [..._generateConstraints()],
          );
        } else if (constraint.maxWidth < 900) {
          return GridView.count(
            crossAxisCount: 2,
            children: [..._generateConstraints()],
          );
        } else {
          return GridView.count(
            crossAxisCount: 4,
            children: [..._generateConstraints()],
          );
        }
      }),
    );
  }
}

List<Widget> _generateConstraints() {
  return List<Widget>.generate(10, (index) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepPurpleAccent,
      ),
    );
  });
}
