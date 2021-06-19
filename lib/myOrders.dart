import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:project/listview.dart';
import 'package:project/models/order.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';
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
          child: FutureBuilder(
            future: getMyOrders(),
            builder: (context,snapshot)
            {
              List list=snapshot.data;
                            if (snapshot.hasError)print(snapshot.error);
                            return snapshot.hasData?ListView.builder(
                itemCount: list.length,
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
                                   texts(text: "\$ "+list[index]['cost'].toString(),color: Colors.red,size: 20,fsize: FontWeight.bold,),
                                   SizedBox(height: 10,),
                                   texts(text: list[index]['date'].toString().substring(0,10),size: 18,),//toString(),)
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
                                            onPressed: (){
                                              Fluttertoast.showToast(
                                              msg: "delet Orders not Working yet",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0
                                          );
                                            }
                                            ),
                                            SizedBox(height: 15,),
                                  texts(text: list[index]['state']),
                                  SizedBox(height: 10,)
                               ],
                             ),
                           )
                            
                          ],
                        ),
                      ),
                    ),
                  );
                }):Center(
                    child: CircularProgressIndicator(),
                  );
          
            }, ),
        ),
      ]),
    );
  }
  Future getMyOrders()
  async{
    Uri url = Uri.parse("http://192.168.137.1/client/getMyOrders.php");
    var resronse = await http.post(url,body: {
      'id': id_client
    });
    print(json.decode(resronse.body));
    return json.decode(resronse.body);
  }
}