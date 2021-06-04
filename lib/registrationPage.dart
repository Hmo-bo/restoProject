import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'reginputs.dart';

class regestrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF7901E),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                width: 200,
                child: Image(image: AssetImage("lib/assets/logo.jpg")),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Create Acccount",
                style: TextStyle(
                    color: Color(0xff0F102C),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20.0),
                  color: Colors.transparent,
                ),
                // ),
                width: 350,
                child: Column(
                  children: [
                    regInputs(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("If You Already Have Account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        /*SizedBox(
                          height: 10,
                        ),*/
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Log In!",
                            style: TextStyle(
                                color: Color(0xff0F102C),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
