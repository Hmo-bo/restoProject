import 'package:flutter/material.dart';
class texts extends StatelessWidget {
  double size;
  Color color;
  String text;
  int price;
  FontWeight fsize;
 
  texts({@required this.text, this.color, this.size, this.price, this.fsize});
  @override
  Widget build(BuildContext context) {

    return Text(text,style: TextStyle(color: color ?? Colors.black ,fontSize: size, fontWeight: fsize ?? FontWeight.normal),);      
  }
}