import 'package:bootcamp_book_explore/MyLibrary.dart';
import 'package:flutter/material.dart';

import 'BookPage.dart';
import 'MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => MainScreen(),
        "/BookPage": (context) => BookPage()
      },
    );
  }
}
