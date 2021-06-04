import 'package:flutter/material.dart';

import 'header.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Column(
          children: [
            header(),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*Text(
                    "User Name",
                    style: TextStyle(color: Colors.grey),
                  ),*/
                  TextField(
                    decoration: InputDecoration(
                      labelText: "User Name",
                    ),
                  ),
                ],
              ),
            ),
            /*SizedBox(
              height: 10,
            ),*/
            Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Text(
                  "Password",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),*/
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),

                  /*decoration: InputDecoration(
              hintText: "Enter Your Password",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),*/
                  obscureText: true,
                ),
              ],
            ))
      ],
    );
  }
}
