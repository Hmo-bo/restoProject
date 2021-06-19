import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:project/likeWidget.dart';
import 'package:project/meal_detailles.dart';
import 'package:project/models/plate.dart';
import 'package:project/tools.dart';
import 'package:project/widget/restaurants.dart';

import '../texts.dart';

class plates extends StatelessWidget {
  @override
    
  Widget build(BuildContext context) {
    return Container(
      //height: double.infinity,
      height: 585,
      child: FutureBuilder(
        future: getmeals(),
        builder: (context,snapshot)
        {
          List list =snapshot.data;
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData?
              ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(top: 10, right: 0, left: 0),
                  height: 250,
                  //width: 80,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2, 0), color: Colors.grey, blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    //  border: Border(bottom: BorderSide(color:Colors.orange,width: 2))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            
                            borderRadius: BorderRadius.circular(15.0),
                            child: 
                          
                            Stack(
                              children: [
                                
                                Image.network("http://192.168.137.1/restaurant/uploads/${list[index]['photo']}",
                                width: 300,
                                ),
                                
                                LikedWidget()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                                    child: texts(
                                      text: list[index]['name'],
                                      size: 22.0,
                                      fsize: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                                      child: texts(
                                        text:
                                            '\$' + list[index]['price'], //this.platesList[index].prix.toString(),
                                        size: 20.0,
                                        color: Colors.red,
                                        fsize: FontWeight.bold,
                                      ))
                                
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              onTap: (){
                Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => meal_detailles(list: list,index: index,)));
              },
              ),
            );
          }):Center(
                                child: CircularProgressIndicator(),
                              );
        },
      )
      
      /*,
    */);
  }
  Future getmeals()async
  {
    Uri url = Uri.parse("http://192.168.137.1/client/getMeals.php");
    var resronse = await http.post(url);
    return json.decode(resronse.body);
  }
}
