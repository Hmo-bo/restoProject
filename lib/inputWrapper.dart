import 'package:flutter/material.dart';

import 'boutton.dart';
import 'inputField.dart';

class inputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: InputField(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "forgot passwod ?",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: boutton(),
            width: 200,
            height: 50,
          )
        ],
      ),
    );
  }
}
