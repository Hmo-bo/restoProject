import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:project/models/restaurant.dart';
import 'package:flutter/material.dart';
import '../restaurantFront.dart';
import '../texts.dart';
import '../tools.dart';

List<restaurant> restaurantsList = [
  restaurant(name: "Italian Food", image: resto1),
  restaurant(name: "Mexico Tacos", image: resto2),
  restaurant(name: "Le Prisien", image: resto3),
  restaurant(name: "Patisserie Parisienne", image: resto4),
  restaurant(name: "Queen & King", image: resto5),
];

Future getRestaurants()async
  {
    Uri url = Uri.parse("http://192.168.137.1/client/getRestaurants.php");
    var resronse = await http.post(url);
    return json.decode(resronse.body);
  }
class restaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: FutureBuilder(
        future: getRestaurants(),
        builder: (context,snapshot){
          List list=snapshot.data;
          if (snapshot.hasError)print(snapshot.error);
          return snapshot.hasData?
          ListView.builder(
          itemCount: restaurantsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Container(
                  height: 220,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: 
                        Center(
                          child: Image.network("http://192.168.137.1/restaurant/uploads/${list[index]['photo']}",
                          height: 190,
                            fit: BoxFit.cover,
                          ),
                        )
                        
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      texts(
                        text: list[index]['name'],
                        size: 25.0,
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
              ),
            );
          }):Center(child: CircularProgressIndicator(),);
        })
      
      
      /*,
    */);
  }
}
