import 'package:flutter/material.dart';
import 'package:project/editProfile.dart';
import 'package:project/myOrders.dart';
import 'package:project/texts.dart';

class profile extends StatelessWidget {
  @override
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
                texts(
                  text: "Bouhadiba Hammou",
                  size: 22,
                  fsize: FontWeight.bold,
                ),
                texts(
                  text: "hammoubouhadiba37@gmail.com",
                  size: 18,
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
                    onPressed: () {},
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
}
