import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation screenOrientation = MediaQuery.of(context).orientation;

    if(screenSize.width >= 500){
      
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Settings",
            style: TextStyle(
              color: Color(0xff672CBC),
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Ionicons.search_outline),
            ),
          ],
        ),
      body: Container(
          alignment: Alignment.center,
          width: screenSize.width,
          color: Colors.deepPurple,
          child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Screen Size: ${screenSize.width.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Screen Size: ${screenOrientation.name}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ))),
    );
  }
}
