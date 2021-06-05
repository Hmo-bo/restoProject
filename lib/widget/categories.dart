import 'package:project/categoryMeals.dart';
import 'package:project/models/category.dart';
import 'package:flutter/material.dart';

import '../texts.dart';
 List <category> categoriesList=[
  category(name: "Burger", image: "burger.jpg"),
  category(name: "Pizza", image: "pizza.jpg"),
  category(name: "Cakes", image: "cakes.jpg"),
  category(name: "Pates", image: "pates.jpg"),
  category(name: "Vegitarian", image: "vegitarian.jpg"),
  category(name: "Grill", image: "gril.jpg"),

] ;
class categories extends StatelessWidget {
  @override
 

  Widget build(BuildContext context) {
    return 
             Container(
               height: 130,
               child: ListView.builder(
                 itemCount: categoriesList.length,
                 scrollDirection: Axis.horizontal,
                    itemBuilder:(_,index){
                   return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                           GestureDetector(
                             onTap:(){
                              Navigator.push(
                              context,
                             new MaterialPageRoute(
                              builder: (context) => categoryMeals()));
                  
                             } ,
                             child: Container(
                              decoration: BoxDecoration(
                              ),
                              child: 
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                     children: [
                                       CircleAvatar(
                                       backgroundImage:AssetImage ('lib/assets/${categoriesList[index].image}',),
                                       radius: 35,
                                        ),
                                        texts(text:categoriesList[index].name ,size: 20,),
                                        ],
                                      ),
                                 ),
                             ),
                           ),
                       ],
                   ),
                 );
                  }
               ),
             );
  }
}