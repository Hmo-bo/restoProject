import 'package:flutter/material.dart';
import 'package:project/texts.dart';

class categoryMeals extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: texts(text: "Category Meals", color: Color(0xff0F102C), size: 25, fsize: FontWeight.bold,),
          ),
        ),
      
    );
  }
}