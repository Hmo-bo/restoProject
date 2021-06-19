import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/models/restaurant.dart';

class plate extends StatelessWidget {
  final String name;
  final double prix;
  //bool is_favorite=true;
  final String image;
  final String category;
  Icon favicon = Icon(
    Icons.favorite,
    color: Colors.red,
    size: 36,
  );
  int quentity = 0;
  final String resto;

  plate({this.name, this.prix, this.image, this.resto, this.category});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
