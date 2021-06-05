import 'package:flutter/material.dart';
import 'package:project/LoginPage.dart';
import 'package:project/registrationPage.dart';
import 'package:project/texts.dart';
import 'package:project/widget/categories.dart';
import 'package:project/widget/plates.dart';
import 'package:project/widget/restaurants.dart';

class navigate_page extends StatefulWidget {
  @override
  _navigate_pageState createState() => _navigate_pageState();
}

class _navigate_pageState extends State<navigate_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: texts(
                text: "Categories",
                size: 25.0,
                fsize: FontWeight.bold,
                color: Color(0xff0F102C),
              ),
            ),
            categories(),
            Divider(
              height: 0.0,
              thickness: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: texts(
                text: "Restaurants",
                size: 25.0,
                fsize: FontWeight.bold,
                color: Color(0xff0F102C),
              ),
            ),
            restaurants(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: texts(
                text: "Featured Meals",
                size: 25.0,
                fsize: FontWeight.bold,
                color: Color(0xff0F102C),
              ),
            ),
            plates(),
          ],
        ),
      ),
    );
  }
}
