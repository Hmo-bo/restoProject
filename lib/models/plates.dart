import 'package:flutter/material.dart';
import 'package:project/likeWidget.dart';
import 'package:project/models/plate.dart';
import 'package:project/tools.dart';
import 'package:project/widget/restaurants.dart';

import '../texts.dart';

class plates extends StatelessWidget {
  @override
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
  Widget build(BuildContext context) {
    return Container(
      //height: double.infinity,
      height: 640,
      child: ListView.builder(
          itemCount: platesList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.only(top: 10, right: 0, left: 0),
                height: 270,
                width: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(2, 0), color: Colors.grey, blurRadius: 4)
                  ],
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
                          child: Stack(
                            children: [
                              Image.asset(
                                this.platesList[index].image,
                                height: 190,
                              ),
                              LikedWidget()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                              child: texts(
                                text: this.platesList[index].name,
                                size: 22.0,
                                fsize: FontWeight.bold,
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 0, 25, 0),
                                child: texts(
                                  text:
                                      '\$' + this.platesList[index].prix.toString(),
                                  size: 20.0,
                                  color: Colors.red,
                                  fsize: FontWeight.bold,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25.0, 0, 0, 0),
                              child: texts(
                                text: this.platesList[index].name,
                                size: 20.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
