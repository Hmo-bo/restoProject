import 'package:flutter/material.dart';
import 'package:project/tools.dart';
import 'package:project/models/plate.dart';
import 'package:project/widget/plates.dart';
import 'package:project/texts.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  plate product = plate(
      name: "Pizza",
      prix: 20.0,
      //is_favorite: false,
      image: "lib/assets/burger.jpg");
  @override
  List<plate> cartMeals = [
    plate(name: "Chease Burger", prix: 14.99, image: pizza1),
    plate(name: "Pizza2", prix: 20.0, image: pizza1),
    plate(name: "Pizza3", prix: 70.0, image: pizza),
    plate(name: "Pizza4", prix: 90.0, image: pizza2),
    plate(name: "Pizza4", prix: 90.0, image: pizza3),
    plate(name: "Pizza4", prix: 90.0, image: pizza4),
  ];

  int quentity = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xffF7901E),
      body: ListView(children: [
         Center(
           child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                   child: texts(text: "My Cart",size: 26.0, fsize: FontWeight.bold, color: Color(0xff0F102C),),
                 ),
         ),
        Container(
          height: 640,
          child: ListView.builder(
              itemCount: cartMeals.length,
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
                      padding: const EdgeInsets.only(left: 10.0, right: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage(cartMeals[index].image)),
                         
                          Container(
                            width: 160,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  texts(
                                    text: cartMeals[index].name,
                                    fsize: FontWeight.bold,
                                    size: 22,
                                  ),
                                  texts(
                                    text:
                                        '\$' + cartMeals[index].prix.toString(),
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  texts(
                                    text: cartMeals[index].name,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 0),
                            child: Container(
                              padding: EdgeInsets.all(0),
                              width: 120,
                              
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                        onPressed: (){
                                          setState((){
                                            cartMeals.remove(index);
                                          });
                                        }),
                                    Row(
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.remove_circle),
                                            onPressed: () {
                                              setState(() {
                                                if (quentity>0)
                                                quentity--;
                                              });
                                            }),
                                      
                                        texts(text: quentity.toString(), size: 15, fsize: FontWeight.bold,),
                                       
                                        IconButton(
                                            icon: Icon(Icons.add_circle),
                                            onPressed: () {
                                              setState(() {
                                                
                                                quentity++;
                                              });
                                            }),
                                      ],
                                    ),
                                  ]),
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
