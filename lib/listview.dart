import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project/tools.dart';

class listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(children: [
        SizedBox(height: 15.0,),
        Container(
          padding: EdgeInsets.only(right: 15.0),
          width: MediaQuery.of(context).size.width - 30.0,
          height: MediaQuery.of(context).size.width - 50.0,
          child: GridView.count(
            crossAxisCount: 2,
            primary: false ,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 0.8,
            children: [
              _buildCard(name: "Pizza", price: 12.0, imgpath: pizza1, added: false, isfavorite: false, context: context ),
              _buildCard(name: "Italian Pizza", price: 15.0, imgpath: pizza2, added: false, isfavorite: false, context: context ),

            ],
            )

          
        ),
        
      ],),
    
      
    );
  }

  Widget _buildCard({String name, double price, String imgpath, bool added, bool isfavorite, context}){
    return Padding(padding: EdgeInsets.only(top: 15.0, bottom: 5.0, right: 5.0, left: 5.0),
    child: InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [BoxShadow(
            color: Colors.grey,
            spreadRadius: 3.0,
            blurRadius: 5.0,
          )],
          color: Colors.white,
        ),
      ),
      ),
    );
  }
}