import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_app/pages/HomeScreen.dart';
import 'package:quran_app/pages/LoginPage.dart';
import 'package:quran_app/pages/bookmark_page.dart';
import 'package:quran_app/pages/travel_page.dart';

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
    TravelPage(),
    BookmarkPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          // if User has logged in
          if (snapshot.hasData) {
            return Scaffold(
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
                      icon: Icon(Ionicons.location_outline),
                      label: "Travel",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Ionicons.bookmark_outline),
                      label: "Bookmarks",
                    ),
                  ],
                ),
              ),
              body: Container(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            );
          } else {
            // if user Not logged in
            return Loginpage();
          }
        },
      ),
    );
  }
}
