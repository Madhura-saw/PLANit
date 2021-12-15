import 'package:flutter/material.dart';
import 'package:planit/firstpg.dart';
import 'package:planit/fpg.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planit',
      theme: ThemeData(
        
        primarySwatch: Colors.blueGrey,
      ),
      home: FPage(),

      // routes:{
      //   '/tiles': (ctx)=>  Tasks(),

      // },
    );
  }
}
