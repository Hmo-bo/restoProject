import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/orderDetails.dart';
import 'package:project/tools.dart';

import 'cartIcon.dart';
import 'plateimg.dart';
import 'package:http/http.dart'as http;

class meal_detailles extends StatefulWidget {
  final List list;
  final int index;

  const meal_detailles({this.list, this.index});
  @override
  _meal_detaillesState createState() => _meal_detaillesState();
}
class _meal_detaillesState extends State<meal_detailles> {


var restoName;
Future getrestoInfo()async
  {
    Uri url = Uri.parse("http://192.168.137.1/client/restoInfo.php");
    var resronse = await http.post(url,body: {
      'id':widget.list[widget.index]["restaurant"]
    });
    var data =json.decode(resronse.body);
    return data;
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Container(
                    width: double.infinity,
                    height: 300,//color: orange,
                    child: ClipRRect(
                      child: Image.network("http://192.168.137.1/restaurant/uploads/${widget.list[widget.index]['photo']}",
                      fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.list[widget.index]['name'],
                            style: TextStyle(
                                color: Color(0xff0F102C),
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FutureBuilder(
                            future: getrestoInfo(),
                            builder: (context,snapshot)
                            { List list=snapshot.data;
                              if(snapshot.hasError)print(snapshot.error);
                              
                              return snapshot.hasData? 
                              FlatButton(
                              child: Text(list[0]['name'],
                                  style: TextStyle(
                                      color: Color(0xff0F102C), fontSize: 20)),
                              onPressed: () {},
                            ):CircularProgressIndicator();
                            }, 
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(widget.list[widget.index]['price']+" DA",
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
                          Text(widget.list[widget.index]['ingrediants'],
                              style: TextStyle(
                                  color: Color(0xff0F102C), fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  ],
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => orderDetails(list: widget.list,index: widget.index,)));
                              },
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
    );
  }
}
