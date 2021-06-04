import 'package:flutter/material.dart';
import 'package:project/bag.dart';
import 'package:project/nav_bar.dart';
import 'navigat_page.dart';
import 'meal_detailles.dart';
import 'navigate_page.dart';
import 'registrationPage.dart';
import 'LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: nav_bar(),
    );
  }
}
