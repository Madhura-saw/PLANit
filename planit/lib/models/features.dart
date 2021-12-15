import 'dart:ffi';

import 'package:flutter/material.dart';

class FeatNames  {
  final String id;
  final  String name;
  final Color color;
  final IconData icon;
   var goto;
  

  FeatNames(
    @required this.id, 
    @required this.name, 
    @required this.color,
    this.icon,
    this.goto

    
    );
  
}
