import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_app/challenges/BookScreen.dart';
import 'package:quran_app/pages/HomeScreen.dart';
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
    Bookscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: (context),
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Add Content"),
                    content: Text("Add your Content here!"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Close"))
                    ],
                  );
                });
          },
          child: Icon(Ionicons.add),
        ),
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
                icon: Icon(Ionicons.home_outline),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.bookmark_outline),
                label: "Challenge",
              ),
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
