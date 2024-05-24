  import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

AppBar appBar(String title) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
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
      );
  }
