import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:project/LoginPage.dart';
import 'package:project/editProfile.dart';
import 'package:project/myOrders.dart';
import 'package:http/http.dart'as http;
import 'package:project/texts.dart';
import 'package:project/tools.dart';

class profile extends StatefulWidget {

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Color(0xff0F102C),
                ),
                SizedBox(
                  height: 5,
                ),
                FutureBuilder(
                  future: getInfo(),
                  builder: (context,snapshot)
                  {
                    List list=snapshot.data;
                            if (snapshot.hasError)print(snapshot.error);
                            return snapshot.hasData?
                  Column(children: [
                    texts(
                      text: list[0]['name'],
                  size: 22,
                  fsize: FontWeight.bold,
                ),
                texts(
                  text:list[0]['email'],
                  size: 18,
                ),
                  ],):Center(
                                child: CircularProgressIndicator(),
                              );
                        
                  
                  },
                ),
                
                SizedBox(
                  height: 50,
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => editProfile()));
                  },
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: Color(0xff0F102C),
                    size: 30,
                  ),
                  title: texts(
                    text: "Edit Profile",
                    color: Color(0xff0F102C),
                    size: 18,
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined,
                      color: Color(0xff0F102C), size: 30),
                ),
                Divider(),
                ListTile(
                   onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => myOrders()));
                  },
                  leading:
                      Icon(Icons.list_alt, color: Color(0xff0F102C), size: 30),
                  title: texts(
                      text: "My Orders", color: Color(0xff0F102C), size: 18),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined,
                      color: Color(0xff0F102C), size: 30),
                ),
                Divider(),
                SizedBox(
                  height: 50,
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
                                    builder: (context) => LoginPage()));
                                    FlutterSession().set("token", "");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.logout),
                        texts(
                          text: "Log Out",
                          size: 22,
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
  Future getInfo()async
  {
      Uri url = Uri.parse("http://192.168.137.1/client/getinfo.php");
    var response = await http.post(url,body: {
      'id':id_client
    });
    var data = await json.decode(response.body);
    return data;

  }
}
