import 'package:flutter/material.dart';
import 'package:project/models/plate.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';

class favorite extends StatefulWidget {
  @override
  _favoriteState createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  //Icon favicon=Icon(Icons.favorite,color: Colors.red, size: 40,);
  List<plate> favoriteMeals = [
    plate(name: "Delciuse vegeterian", prix: 15, image: veg4,resto: "Vegeterian Paradise",),
    plate(name: "Healthy Food", prix: 15, image: veg2,resto: "Queen & King",),
    plate(name: "vegeterian food", prix: 15, image: veg1,resto: "Italian Food",),
    plate(name: "veget Salade", prix: 15, image: veg3,resto: "Le Parisien",),
    plate(name: "Super Salade", prix: 15, image: veg5,resto: "Mexico Tacos",),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7901E),
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: texts(
              text: "My Favorites",
              size: 26.0,
              fsize: FontWeight.bold,
              color: Color(0xff0F102C),
            ),
          ),
        ),
        Container(
          height: 640,
          child: ListView.builder(
              itemCount: favoriteMeals.length,
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
                                  AssetImage(favoriteMeals[index].image)),
                          Container(
                            //  color: Colors.blue,
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  texts(
                                    text: favoriteMeals[index].name,
                                    fsize: FontWeight.bold,
                                    size: 22,
                                  ),
                                  texts(
                                    text: '\$' +
                                        favoriteMeals[index].prix.toString(),
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  texts(
                                    text: favoriteMeals[index].name,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 5, right: 12),
                            width: 60,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      icon: favoriteMeals[index].favicon,
                                      onPressed: () {
                                        setState(() {
                                          if (this.favoriteMeals[index].favicon ==Icons.favorite) {
                                                   this.favoriteMeals[index].favicon =
                                                Icon(Icons.favorite_border,
                                                    color: Colors.red,
                                                    size: 36);
                                          } else {
                                            this.favoriteMeals[index].favicon =
                                                Icon(Icons.favorite,
                                                    color: Colors.red,
                                                    size: 36);
                                          }
                                        });
                                      }),
                                ]),
                          ),
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
