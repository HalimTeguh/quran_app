import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_app/page/HomeScreen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Index 1: Business',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xff672CBC),
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.home_outline), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.bookmark_outline), label: "Bookmark"),
            ],
          ),
        ),
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
