import 'package:flutter/material.dart';
import 'package:project/listview.dart';
import 'package:project/models/order.dart';
import 'package:project/texts.dart';
class myOrders extends StatefulWidget {
  @override
  _myOrdersState createState() => _myOrdersState();
}

class _myOrdersState extends State<myOrders> {
  List<order>ordersLise =[
  order(resto: "Resto Parisien",date: DateTime.utc(2002),  total: 250.0),
  order(resto: "Turkish Restaurant",date: DateTime.utc(2002),  total: 250.0),
  order(resto: "Mexican Food",date: DateTime.utc(2002),  total: 250.0),
  order(resto: "Egiptien Mataam",date: DateTime.utc(2002),  total: 250.0),
  order(resto: "Egiptien Mataam",date: DateTime.utc(2002),  total: 250.0),
  order(resto: "Egiptien Mataam",date: DateTime.utc(2002),  total: 250.0),
  order(resto: "Egiptien Mataam",date: DateTime.utc(2002),  total: 250.0),
];
order or1=order(resto: "Turkish Restaurant", date:DateTime.utc(2002) , total: 9500.00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7901E),
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: texts(
                    text: "My Orders",
                    size: 26.0,
                    fsize: FontWeight.bold,
                    color: Color(0xff0F102C),
                  ),
            ),
          ),
        ),
         Container(
          height: 765,
          child: ListView.builder(
              itemCount: ordersLise.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60.0),
                            topLeft: Radius.circular(60.0),
                            bottomRight: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(2, 1),
                              blurRadius: 2)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                         Icon(Icons.article_rounded,size: 50,color: Color(0xff0F102C),),
                         Padding(
                           padding: const EdgeInsets.only(left: 20),
                           child: Container(
                             width: 200,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 texts(text:ordersLise[index].resto,size: 22,fsize: FontWeight.bold, ),
                                 texts(text: "\$ "+ordersLise[index].total.toString(),color: Colors.red,size: 20,fsize: FontWeight.bold,),
                                 SizedBox(height: 10,),
                                 texts(text: ordersLise[index].date.toString().substring(0,10),size: 18,),//toString(),)
                               ],
                             ),
                           ),
                         ),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             SizedBox(height: 10,),
                           ],
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 20),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               
                                      IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Colors.red,
                                          ),
                                          onPressed: (){}
                                          ),
                                          SizedBox(height: 15,),
                                texts(text: or1.state,),
                                SizedBox(height: 10,)
                             ],
                           ),
                         )
                          
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}