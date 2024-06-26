import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

import '../components/appBar.dart';
import '../components/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> with TickerProviderStateMixin {

  late TabController _tabController = TabController(length: 4, vsync: this);

  static final List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
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
              onTap: () {
                Navigator.pushNamed(context, '/detailSurah', arguments: index);
              },
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
    const Text(
      'Para',
    ),
    const Text(
      'Page',
    ),
    const Text(
      'Hijb',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Quran App"),
      drawer: mainDrawer(context),
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
                height: 14,
              ),
              Container(
                child: TabBar(
                  controller: _tabController,
                  labelStyle: TextStyle(
                      color: Color(0xff672CBC),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                  unselectedLabelStyle: TextStyle(
                      color: Color(0xff8789A3),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  indicator: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xff672CBC), width: 3))),
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text("Surah"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text("Para"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text("Page"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text("Hijb"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [..._widgetOptions],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
