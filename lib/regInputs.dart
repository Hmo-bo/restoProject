import 'package:flutter/material.dart';

class regInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Material(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "User Name",
                    labelStyle:
                        TextStyle(color: Color(0xffB4B4B2), fontSize: 15),
                    filled: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Color(0xffB4B4B2), fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Pone Number",
                    labelStyle:
                        TextStyle(color: Color(0xffB4B4B2), fontSize: 15),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(height: 20),
            Material(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey )),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle:
                        TextStyle(color: Color(0xffB4B4B2), fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              height: 50,
              child: loginBotton(),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.0)),
              //child: Text("register"),
            )
          ],
        ),
      ),
    );
  }
}

Widget loginBotton() {
  return RaisedButton(
    onPressed: () {},
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    color: Color(0xff0F102C),
    textColor: Colors.white,
    child: Text(
      "Register",
      style: TextStyle(fontSize: 20),
    ),
  );
}
