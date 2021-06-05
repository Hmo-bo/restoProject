import 'package:flutter/material.dart';

class order {

  final String resto;
  final DateTime date;
  final double total;
   String state="Not Ready";

  order( {@required this.resto, @required this.date, @required this.total});

}