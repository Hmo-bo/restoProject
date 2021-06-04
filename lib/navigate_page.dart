import 'package:flutter/material.dart';
import 'package:project/LoginPage.dart';
import 'package:project/registrationPage.dart';
import 'package:project/texts.dart';
import 'package:project/widget/categories.dart';
import 'package:project/widget/plates.dart';
import 'package:project/widget/restaurants.dart';

class navigate_page extends StatefulWidget {

  @override
  _navigate_pageState createState() => _navigate_pageState();
}

class _navigate_pageState extends State<navigate_page> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
     Container(
        height: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
             children: [
               Padding(
                padding: const EdgeInsets.all(8.0),
                 child: texts(text: "Categories",size: 25.0, fsize: FontWeight.bold, color: Color(0xff0F102C),),
               ),
               categories(),
               Divider(height: 0.0, thickness: 2.0,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: texts(text: "Restaurants",size: 25.0, fsize: FontWeight.bold, color: Color(0xff0F102C),),
               ),
               restaurants(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: texts(text: "Featured Meals",size: 25.0, fsize: FontWeight.bold, color: Color(0xff0F102C),),
               ),
                plates(),
                
             ],
        ),
    ), 
     /*
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
        onTap: ,
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
           
             icon: Icon(Icons.shopping_cart, size: 30.0, color: Colors.white,),
             
             title: Text('Cart', style: TextStyle(color: Colors.white, fontSize: 16.0),)
             
           ),        
        ],                                                                       
      ),
    ),                                                                         
  )                                                                            
),*/
      
      
       );
    
  }
}
           


      
      
      
      
      

      
    
      
      