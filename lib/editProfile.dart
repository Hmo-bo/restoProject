import 'package:flutter/material.dart';
import 'package:project/listview.dart';
import 'package:project/nav_bar.dart';
import 'package:project/texts.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F102C),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 0.0, right: 10, left: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                texts(
                    text: 'Edit Profile',
                    size: 30,
                    fsize: FontWeight.bold,
                    color: Colors.white),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 360,
                  height: 465,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 2),
                            color: Colors.grey,
                            blurRadius: 4)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        texts(
                          text: "First Name",
                          size: 22,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: ("Your First Name"),
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        texts(
                          text: "Last Name",
                          size: 22,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: ("Your Last Name"),
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        texts(
                          text: "Password",
                          size: 22,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: ("Add A New Password"),
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        texts(
                          text: "Phone Number",
                          size: 22,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: ("Add A New Phone Number"),
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  width: 160,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Color(0xff0F102C),
                    color: Color(0xffF7901E),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => nav_bar()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.save_sharp),
                        texts(
                          text: "Save",
                          size: 25,
                          fsize: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
