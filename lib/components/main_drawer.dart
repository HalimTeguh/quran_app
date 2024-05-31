import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quran_app/challenges/AccountScreen.dart';
import 'package:quran_app/pages/SettingScreen.dart';
import 'package:quran_app/pages/bookmark_page.dart';
import 'package:quran_app/pages/challenge_page.dart';

Drawer mainDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Color(0xff672CBC),
    child: Column(
      children: [
        DrawerHeader(
          padding: EdgeInsets.only(bottom: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black54),
                  child: Icon(
                    Ionicons.person,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Halim Teguh Saputro",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Accountscreen();
                  }));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(
                  Ionicons.person_outline,
                  color: Colors.white,
                ),
                title: Text(
                  "Account",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return BookmarkPage();
                  }));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(
                  Ionicons.bookmark_outline,
                  color: Colors.white,
                ),
                title: Text(
                  "Bookmark",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ChallengePage();
                  }));
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(
                  Ionicons.barbell_outline,
                  color: Colors.white,
                ),
                title: Text(
                  "Challenge",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          child: Divider(),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return Settingscreen();
            }));
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          leading: Icon(
            Ionicons.settings_outline,
            color: Colors.white,
          ),
          title: Text(
            "Settings",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text(
                      "LOGOUT",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          color: Color(0xff672CBC)),
                    ),
                    content: Text(
                      "You wanna Logout from this account, are you sure?",
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                    actions: [
                      OutlinedButton(
                        onPressed: () {
                          




                        },
                        child: Text("Yes, I do"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("No, I don't"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff672CBC)),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                      ),
                    ],
                  );
                });
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          leading: Icon(
            Ionicons.log_out_outline,
            color: Colors.white,
          ),
          title: Text(
            "Log out",
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
