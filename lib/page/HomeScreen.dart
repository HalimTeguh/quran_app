import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffBBC4CE),
                  ),
                ),
              ),
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("public/images/ListIcon.png"),
                    ),
                  ),
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      color: Color(0xff240F4F),
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Al-Fatihah",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff240F4F),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "MECCAN",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                                color: Color(0xff8789A3),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                  color: Color(0xff8789A3),
                                  shape: BoxShape.circle),
                            ),
                            const Text(
                              "7 VERSE",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                                color: Color(0xff8789A3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: const Text(
                        "ةحتافلا",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff672CBC),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    ),
    const Text(
      'Index 1: Business',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Ionicons.reorder_two_outline),
          title: const Text(
            "Quran App",
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
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Assalamualaikum",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18,
                    color: Color(0xff8789A3),
                  ),
                ),
                const Text(
                  "Tanvir Ahassan",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Color(0xff240F4F),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 131,
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffDF98FA),
                            Color(0xff9055FF),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      right: -20,
                      child: Container(
                        height: 126,
                        width: 206,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "public/images/Quran.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Ionicons.book,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Last Read",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Al-Fatihah",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text(
                            "Ayah No: 1",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Warna shadow
                        spreadRadius: -4, // Menyebar dari sumber cahaya
                        blurRadius: 2,
                        offset: const Offset(0, 5), // Posisi shadow
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    selectedItemColor: const Color(0xff672CBC),
                    onTap: _onItemTapped,
                    currentIndex: _selectedIndex,
                    elevation: 0,
                    items: [
                      BottomNavigationBarItem(
                        icon: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(bottom: 5),
                          height: 5,
                          width: (_selectedIndex == 0) ? 100 : 0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xff672CBC)),
                        ),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: AnimatedContainer(
                          curve: Curves.easeInOut,
                          alignment: Alignment.centerLeft,
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(bottom: 5),
                          height: 5,
                          width: (_selectedIndex == 1) ? 100 : 0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xff672CBC)),
                        ),
                        label: "Home",
                      ),
                    ],
                  ),
                ),
                Container(
                  child: _widgetOptions.elementAt(_selectedIndex),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
