import 'package:flutter/material.dart';

class plateimg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage("assets/images/pizza_fresca.jpg"),
      ),
    );
  }
}
