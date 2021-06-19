import 'package:flutter/material.dart';
import 'package:project/tools.dart';

class LikedWidget extends StatefulWidget {

  @override
  _LikedWidgetState createState() => _LikedWidgetState();
}
class _LikedWidgetState extends State<LikedWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          height: 35,width: 35,
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(35),
              color: Colors.black
              ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child:  Icon(Icons.favorite_border,
              color: Colors.red,
              size: 25,
              
              )
            
          ),
        ),
      ),
    );
} 
  
  }

