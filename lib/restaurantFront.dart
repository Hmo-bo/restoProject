import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/meal_detailles.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';
import 'package:project/models/plate.dart';
import 'package:project/models/plates.dart';
import 'package:http/http.dart'as http;

class restaurantFront extends StatefulWidget {
  final List list;
  final int index;

  const restaurantFront({this.list, this.index});
  @override
  _restaurantFrontState createState() => _restaurantFrontState();
}



class _restaurantFrontState extends State<restaurantFront> {
  
  getMeals()async
{
  Uri url = Uri.parse("http://192.168.137.1/client/getRestoMeals.php");
    var resronse = await http.post(url,body: {
      'id': widget.list[widget.index]["id_restaurant"]
    });
    print(json.decode(resronse.body));
    return json.decode(resronse.body);
}


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff0F102C),
        
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    height: 190,
                    width: 338,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.network("http://192.168.137.1/restaurant/uploads/${widget.list[widget.index]['photo']}")
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                        width: double.infinity,
                        height: 38,
                        child: Align(
                          alignment: Alignment.center,
                          child: texts(
                            text: widget.list[widget.index]["name"],
                            color: Colors.white,
                            size: 25,
                            fsize: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Container(
                        width: 300,
                        child: Column(
                          children: [
                            texts(
                              text: widget.list[widget.index]['name'],
                              color: Color(0xff0F102C),
                              size: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xff0F102C),
                                  size: 20,
                                ),
                                texts(
                                  text: widget.list[widget.index]['position'],
                                  color: Color(0xff0F102C),
                                  size: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 25,
                    thickness: 2,
                    color: Colors.grey,
                    indent: 5,
                    endIndent: 5,
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          texts(
                            text: "Our Meals",
                            color: Color(0xff0F102C),
                            size: 20,
                            fsize: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff0F102C),
                            size: 20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 340,
                        child: FutureBuilder(
                          future: getMeals(),
                          builder: (context,snapshot)
                          {
                            List list=snapshot.data;
                            if (snapshot.hasError)print(snapshot.error);
                            return snapshot.hasData?
                            ListView.builder(
                              itemCount: list.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 2, right: 2, bottom: 10),
                                  child: GestureDetector(
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0),
                                              bottomRight: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(1, 1),
                                                blurRadius: 2)
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              child: Image.network("http://192.168.137.1/restaurant/uploads/${list[index]['photo']}",
                                                width: 110,
                                                height: 110,
                                                fit: BoxFit.cover,
                                                
                                                )
                                                
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                                color: Colors.white,
                                              ),
                                              margin: EdgeInsets.only(left: 10),
                                              
                                              width: 250,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    texts(
                                                      text: list[index]["name"],
                                                      fsize: FontWeight.bold,
                                                      size: 22,
                                                    ),
                                                    texts(
                                                      text: '\$' +
                                                          list[index]["price"].toString(),
                                                      size: 20,
                                                      color: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    texts(
                                                      text: list[index]["category"],
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  
                                  onTap: ()
                                  {
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
                        ),
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
