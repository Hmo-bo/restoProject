import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:project/meal_detailles.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';
import 'package:project/widget/plates.dart';

class categoryMeals extends StatefulWidget {

  final String name;

  const categoryMeals({Key key, this.name});
  @override
  _categoryMealsState createState() => _categoryMealsState();
}

class _categoryMealsState extends State<categoryMeals> {


getCategoryMeal()async
  {
    Uri url = Uri.parse("http://192.168.137.1/client/getCategoryMeal.php");
    var resronse = await http.post(url,body: {
      'name': widget.name
    });
    return json.decode(resronse.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: texts(text: widget.name,color: Colors.white,),
        centerTitle: true
      ),
      body:
          FutureBuilder(
                          future: getCategoryMeal(),
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
                                          //mainAxisAlignment:
                                              //MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            ClipRRect(
                                              
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              child: Image.network("http://192.168.137.1/restaurant/uploads/${list[index]['photo']}",
                                                width: 110,
                                                height: 110,
                                                fit: BoxFit.cover,)
                                            ),
                                            SizedBox(width: 10,),
                                            Container(
                                               //color: Colors.blue,
                                              width: 200,
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
                                      meal_detailles(list: list,index: index,);
                                    },
                                  ),
                                );
                              }):Center(
                                child: CircularProgressIndicator(),
                              );
                        
                          },
                        ),
                          
      
    );
  }
   
}