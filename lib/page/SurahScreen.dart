import 'package:flutter/material.dart';

class Surahscreen extends StatefulWidget {
  const Surahscreen({super.key});

  @override
  State<Surahscreen> createState() => _SurahscreenState();
}

class _SurahscreenState extends State<Surahscreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    if(id == null || id == ''){
      Navigator.pushNamed(context, '/nav');
    }
    return Scaffold(
      body: Center(
        child: Text('$id'),
      ),
    );
  }
}