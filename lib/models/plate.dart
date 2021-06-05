import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/restaurant.dart';

class plate extends StatelessWidget {
final String name;
  final double prix;
  //bool is_favorite=true;
  final String image;
  Icon favicon=Icon(Icons.favorite, color: Colors.red, size: 36,);
  int quentity=0;
  final String resto;

  plate({@required this.name,@required this.prix,/* this.is_favorite*/@required this.image, @required this.resto});
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}