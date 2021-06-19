import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:project/bag.dart';
import 'package:project/nav_bar.dart';
import 'package:project/orderDetails.dart';
import 'package:project/profile.dart';
import 'package:project/restaurantFront.dart';
import 'package:project/restoList.dart';
import 'navigat_page.dart';
import 'meal_detailles.dart';
import 'navigate_page.dart';
import 'registrationPage.dart';
import 'LoginPage.dart';

void main() 
{
  WidgetsFlutterBinding.ensureInitialized();
  dynamic token = FlutterSession().get('token');
  runApp(MaterialApp(
      home: token=='' ? LoginPage():nav_bar()
    )
  );
}

