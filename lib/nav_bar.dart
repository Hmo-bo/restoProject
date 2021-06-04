import 'package:flutter/material.dart';
import 'package:project/bag.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';
import 'cartPage.dart';
import 'navigate_page.dart';
import 'favorite.dart';


class nav_bar extends StatefulWidget {

  @override
  _nav_barState createState() => _nav_barState();
}

class _nav_barState extends State<nav_bar> {
   int index = 0;
   Icon cusIcon=Icon(Icons.search, size: 35.0,);
  Widget cusSearchBar = Text('Lih Lih', style: TextStyle(fontSize: 25.0),);
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xff0F102C),
        toolbarHeight: 60.0,
        actions: [
         
          IconButton(icon: cusIcon, onPressed:(){
            setState(() 
            {
                  if(this.cusIcon.icon == Icons.search)
                    {
                    this.cusIcon = Icon(Icons.cancel, color: Colors.white, size: 35.0,);
                    this.cusSearchBar = TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What Do You Want To Eat?',
                        hintStyle: TextStyle(fontSize: 18.0, color: Colors.white70),
                      ),
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    );
                  } 
                  else{
                     this.cusIcon=Icon(Icons.search, size: 35.0,);
                     this.cusSearchBar = Text('Lih Lih');
                  }
            });          
          }),

          /*IconButton(icon: Icon(Icons.account_circle, color: Colors.white, ),
           onPressed: (){},),*/
             Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.account_circle,size: 35.0),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
        ],
        title: cusSearchBar,
        
         
     ),
     
     endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xff0F102C)),
              accountName: texts(
                text: "username lading...",
                color: Colors.white,
                fsize: FontWeight.bold,
                size: 18,
              ),
              accountEmail: texts(
                text:  "email loading...",
                color: Colors.white,
              ),
            ),
            /*ListTile(
              onTap: () {
                changeScreen(context, Home());
              },
              leading: Icon(Icons.home),
              title: texts(text: "Home"),
            ),*/

            /*ListTile(
              onTap: () async{
                await user.getOrders();
                changeScreen(context, OrdersScreen());
              },
              leading: Icon(Icons.bookmark_border),
              title: texts(text: "My orders"),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, CartScreen());
              },
              leading: Icon(Icons.shopping_cart),
              title: texts(text: "Cart"),
            ),*/
            ListTile(/*
              onTap: () {
                user.signOut();
                changeScreenReplacement(context, LoginScreen());
              },*/
              leading: Icon(Icons.exit_to_app),
              title: texts(text: "Log out"),
            ),
          ],
        ),
      ),

      backgroundColor: Colors.white,
      
      body:  _getBody(index),
      
      bottomNavigationBar: ClipRRect(
      /*  borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),                                            
          topRight: Radius.circular(20.0),  
              ), */
        
        child: BottomNavigationBar(  
          backgroundColor: Color(0xff0F102C),
            currentIndex: index,
            onTap: (value) => setState(() => index = value),                                         
    
            items: [

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30.0),
              title: Text('Favorite', style: TextStyle( fontSize: 16.0),),
                
            ),
            BottomNavigationBarItem(
             icon: Icon(Icons.home, size: 30.0),
             title: Text('Home', style: TextStyle( fontSize: 16.0),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, size: 30.0),
                title: Text('Cart', style: TextStyle( fontSize: 16.0),)
             
            ),

            
          ],
        
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xffF7901E),
        showUnselectedLabels: true,

            type: BottomNavigationBarType.fixed,
        ),
      ), 
       
);


  }
 
  Widget _getBody(int index) {
    switch (index) {
      case 1:
        return navigate_page();  // Create this function, it should return your first page as a widget
      case 0:
        return favorite(); // Create this function, it should return your second page as a widget
      case 2: 
        return ShoppingBag(); // Create this function, it should return your fourth page as a widget
    }

    return Center(child: Text("There is no page builder for this index."),);
  }
  }

  

  