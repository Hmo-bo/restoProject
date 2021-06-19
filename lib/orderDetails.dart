import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';
import 'package:project/meal_detailles.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class orderDetails extends StatefulWidget {
  final List list;
  final int index;

  const orderDetails({this.list, this.index});
  @override
  _orderDetailsState createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {
  String _locationMessage = "";

  void _getCurrentLocatio() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    getAddressFromCordinates(
        Coordinates(position.latitude, position.longitude));
  }

  getAddressFromCordinates(Coordinates cords) async {
    var addresses = await Geocoder.local.findAddressesFromCoordinates(cords);
    var first = addresses.first;

    _locationMessage = "${first.addressLine}";
  }

  @override
  int quentity = 1;
  double price = 12.99;
  String addr;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: TextStyle(color: Color(0xff0F102C)),
        ),
        backgroundColor: Color(0xffF7901E),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
                right: 7,
              ),
              child: Container(
                height: 550,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      // topLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(20.0),
                      // topRight: Radius.circular(10.0)
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 1),
                          blurRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.network("http://192.168.137.1/restaurant/uploads/${widget.list[widget.index]['photo']}",
                          height: 190,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              widget.list[widget.index]['name'],
                              style: TextStyle(
                                  color: Color(0xff0F102C),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(widget.list[widget.index]["price"] + 'DA',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Row
                     (children: [Text("Ingrediants:",
                          style: TextStyle(
                              color: Color(0xff0F102C), fontSize: 20)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                       // color: blue,
                        width: 260,
                        height: 50,
                        child: Center(
                          child: Text(
                              widget.list[widget.index]["ingrediants"],
                              style: TextStyle(
                                  color: Color(0xff0F102C),
                                  fontSize: 18)),
                        ),
                      ),]),
                      
                      SizedBox(
                        height: 5.0,
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.remove_circle,
                                      size: 23,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (quentity > 1) quentity--;
                                      });
                                    }),
                                Text('QTE:  ' + quentity.toString(),
                                    style: TextStyle(
                                        color: Color(0xff0F102C), fontSize: 20)),
                                IconButton(
                                    icon: Icon(
                                      Icons.add_circle,
                                      size: 23,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        quentity++;
                                      });
                                    }),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 190,
                            decoration: BoxDecoration(
                                color: Color(0xff0F102C),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 23,
                                ),
                                TextButton(
                                  onPressed: () {
                                    _getCurrentLocatio();
                                  },
                                  child: Text("Add Your Location ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(
                        height: 10.0,
                      ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              texts(
                                text: (_locationMessage),
                                color: Color(0xff0F102C).withOpacity(0.8),
                                size: 16,
                              ),
                            ],
                          ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text('Total: ',
                              style: TextStyle(
                                  color: Color(0xff0F102C),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                                  Text((int.parse(widget.list[widget.index]['price']) * quentity).toString() + "DA",
                                      style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                     color: Color(0xffF7901E),),
                 
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
                        child: Row(
                          children: [
                            Icon(Icons.payments, color: Colors.white, size: 23),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Confirm Order ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ],
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
