import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/models/order.dart';
import 'package:project/models/restaurant.dart';
import 'package:project/restaurantFront.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';

class restoList extends StatefulWidget {
  @override
  _restoListState createState() => _restoListState();
}

List<restaurant> restaurantsList = [];/*
  restaurant(
      name: "Italian Food", image: resto1, location: "Ali Menjeli, El-Khroub"),
  restaurant(
      name: "Mexico Tacos", image: resto2, location: "Ali Menjeli, El-Khroub"),
  restaurant(
      name: "Le Prisien", image: resto3, location: "Ali Menjeli, El-Khroub"),
  restaurant(
      name: "Patisserie Parisienne",
      image: resto4,
      location: "Ali Menjeli, El-Khroub"),
  restaurant(
      name: "Queen & King", image: resto5, location: "Ali Menjeli, El-Khroub"),
];*/

class _restoListState extends State<restoList> {
  
  Future getRestaurants()async
  {
    Uri url = Uri.parse("http://192.168.137.1/client/getRestaurants.php");
    var resronse = await http.post(url);
    print(json.decode(resronse.body));
    return json.decode(resronse.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants", style: TextStyle(color: Color(0xffF7901E))),
        backgroundColor: Color(0xff0F102C),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
          child:FutureBuilder(
            future: getRestaurants(),
            builder: (context,snapshot)
            {List list =snapshot.data;
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData?
              ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  GestureDetector(
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(
                        "http://192.168.137.1/restaurant/uploads/${list[index]['photo']}"),
                        fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                        
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.6),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            width: double.infinity,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                texts(
                                  text: list[index]["name"],
                                  size: 23.0,
                                  color: Colors.white,
                                  fsize: FontWeight.bold,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on,color: orange,),
                                    Container(
                                      width: 300,
                                      child: Center(
                                        child: 
                                            texts(text: list[index]['position'],color: orange,size: 20,),
                                          
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: ()
                    {
                      Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => restaurantFront(list: list,index: index,)));
                    },
                  )
                );

              }
            
          ):Center(
            child: CircularProgressIndicator(),
          );
            }
            )
      
      )
    
      
    );
  
  }
  
}
