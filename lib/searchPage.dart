import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/restaurantFront.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';
import 'package:http/http.dart'as http;
class searchPage extends StatefulWidget {

  @override
  _searchPageState createState() => _searchPageState();
}
TextEditingController search=TextEditingController();

class _searchPageState extends State<searchPage> {
  Future getrestos()async{
    Uri url = Uri.parse("http://192.168.137.1/client/getRestaurants.php");
    var resronse = await http.post(url,body: {
      'name': search.text
    });
    return json.decode(resronse.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: IconButton(icon: Icon(Icons.search)),
           onPressed: (){
             
           }
           )
        ],
        backgroundColor: blue,
        title: TextField(
          controller: search,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.grey,
            )
          ),
        ),
      ),
      body: Column(
        children: [
          texts(text: "Restaurants",),
          Expanded(child: Container(
            child: FutureBuilder(
              future: getrestos(),
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
              ):Center(child: texts(text: "No Restaurant Match",));
               }
              )
              )
            
            
            )
          
        ],
      ),
    );
  }
}