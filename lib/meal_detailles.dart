import 'package:flutter/material.dart';

import 'cartIcon.dart';
import 'plateimg.dart';

class meal_detailles extends StatefulWidget {
  @override
  _meal_detaillesState createState() => _meal_detaillesState();
}

class _meal_detaillesState extends State<meal_detailles> {
  String plate_name = "Pizza 4 seasons",
      restarent_name = "El-Khaima",
      ingrediants = "Tomato,Cheese,Meat,Olive,Hotdogs";
  int price = 450;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 280,
                child: plateimg(),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plate_name,
                        style: TextStyle(
                            color: Color(0xff0F102C),
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FlatButton(
                        child: Text(restarent_name,
                            style: TextStyle(
                                color: Color(0xff0F102C), fontSize: 30)),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("$price DA",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text("Ingrediants:",
                          style: TextStyle(
                              color: Color(0xff0F102C), fontSize: 20)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(ingrediants,
                          style: TextStyle(
                              color: Color(0xff0F102C), fontSize: 20)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Color(0xffF7901E),
                    height: 60.0,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: () {},
                          color: Color(0xff0F102C),
                          child: Text(
                            "Add To cart",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {},
                          color: Color(0xff0F102C),
                          child: Text(
                            "Place Order",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
