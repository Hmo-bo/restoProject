import 'package:project/models/restaurant.dart';
import 'package:flutter/material.dart';
import '../texts.dart';
import '../tools.dart';
 List <restaurant> restaurantsList=[
  restaurant(name: "Italian Food", image: resto1),
  restaurant(name: "Mexico Tacos", image: resto2),
  restaurant(name: "Le Prisien", image: resto3),
  restaurant(name: "Patisserie Parisienne", image: resto4),
  restaurant(name: "Queen & King", image: resto5),

] ;

class restaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
                 height: 250,
                 child: ListView.builder(
                 itemCount: restaurantsList.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder:(_,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                 height: 220,
                 width: 250,
                 decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(restaurantsList[index].image,height: 190,),
                            ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                            child: texts(text: restaurantsList[index].name,size: 25.0,),
                          )
                                ],
                              ),
                    
                      ),
                    );

                 }),
               
    );
    
  }
}