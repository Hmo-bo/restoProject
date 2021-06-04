import 'package:flutter/material.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';
import 'package:project/widget/restaurants.dart';

import 'models/plate.dart';
List <plate>restoplates=[
  plate(name: "pizza", prix: 50, image: pizza1),
  plate(name: "pizza2", prix: 20, image: pizza2),
  plate(name: "pizza3", prix: 70, image: pizza3),
  plate(name: "pizza4", prix: 90, image: pizza4),
];
class rest_meals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [      
          Container(
                 //height: double.infinity,
                 height: 750,
                 child: ListView.builder(
                 itemCount: restoplates.length,
                 scrollDirection: Axis.vertical,
                 itemBuilder:(_,index){
                  String pr;
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                 height: 250,
                 width: 80,
                 decoration: BoxDecoration(
                   boxShadow: [BoxShadow(offset: Offset(2,0), color: Colors.grey, blurRadius: 4)],
                    borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      //  border: Border(bottom: BorderSide(color:Colors.orange,width: 2))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(restoplates[index].image,height: 190,),
                              ),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               
                                Padding(
                              padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                              child: texts(text: restoplates[index].name,size: 25.0,),
                            ),
                            
                            //pr = restoplates[index].prix.toString(),
                          
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10.0, 0, 25, 0),
                              child: texts(text: restoplates[index].prix.toString(), size: 25.0, color: Colors.red)
                            )
                              ],
                            )
                            
                                  ],
                                ),
                      ),
                    ),
                      ),
                    );

                 }),
               
            ),
        ],
      ),
    );
  }
}
