import 'package:flutter/material.dart';
import 'package:quran_app/components/main_drawer.dart';

import '../components/appBar.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Bookmark'),
      drawer: mainDrawer(context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
              "my Bookmarks",
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
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text((index+1).toString()),),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
