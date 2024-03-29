import 'dart:developer';

import 'package:project/listview.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';
import 'package:project/widget/categories.dart';
import 'package:project/widget/plates.dart';
import 'package:project/widget/restaurants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'models/plate.dart';


class navigat_page extends StatelessWidget {
    
    List<plate> platesList = [
    plate(name: "Chease Burger", prix: 14.99, image: burger1, resto: 'Fast Food',),
    plate(name: "Pizza 4 Seasons", prix: 13.99, image: pizza2, resto: 'Le Prisien',),
    plate(name: "Salade Mexicanne", prix: 16.99, image: veg3, resto: 'Queen & King',),
    plate(name: "Super Cake", prix: 19.99, image: cake1, resto: 'Patisserie Parisienne',),
    plate(name: "Pasta Del Mondo", prix: 19.99, image: patte1, resto: 'Italian Food',),
    plate(name: "Birthday Cake", prix: 19.99, image: cake1, resto: 'Patisserie Parisienn',),
    plate(name: "King BBQ", prix: 19.99, image: grill1, resto: 'Royal Grill',),
    plate(name: "Hot Grill", prix: 19.99, image: grill3, resto: 'Royal Grill',),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     ),
     
  bottomNavigationBar: Container(                                           
  decoration: BoxDecoration(   
    borderRadius: BorderRadius.only(                                           
      topRight: Radius.circular(30), topLeft: Radius.circular(30)),            
    boxShadow: [                                                               
      BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),       
    ],                                                                         
  ),                                                                           
  child: ClipRRect(   
                                                             
    borderRadius: BorderRadius.only(                                           
    topLeft: Radius.circular(30.0),                                            
    topRight: Radius.circular(30.0),                                           
    ),                                                                         
    child: 
    new Theme(
      data: Theme.of(context).copyWith(canvasColor: Color(0xff0F102C)),
      child: BottomNavigationBar(  
      selectedItemColor: Color(0xffF7901E),
        items: <BottomNavigationBarItem>[ 
           BottomNavigationBarItem(
             icon: Icon(Icons.favorite, size: 30.0, color: Colors.white),
             title: Text('Favorite', style: TextStyle(color: Colors.white, fontSize: 16.0),),
           ), 
           BottomNavigationBarItem(
             icon: Icon(Icons.home, size: 30.0, color: Colors.white),
             title: Text('Home', style: TextStyle(color: Colors.white, fontSize: 16.0),)
           ),                                      
           BottomNavigationBarItem(
             icon: Icon(Icons.shopping_cart, size: 30.0, color: Colors.white),
             title: Text('Cart', style: TextStyle(color: Colors.white, fontSize: 16.0),)
           ),        
        ],                                                                       
      ),
    ),                                                                         
  )                                                                            
),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
             children: [
               categories(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: texts(text: "Restaurants",size: 25.0),
               ),
               restaurants(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: texts(text: "Featured Meals",size: 25.0),
               ),
                plates(),
                   ],
        ),
      ),
    );
  }
}
 


                          