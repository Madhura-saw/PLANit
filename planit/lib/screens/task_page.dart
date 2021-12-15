import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:planit/screens/tasks_folder/details.dart';
import 'package:planit/screens/tasks_folder/elements.dart';

class TasksPage  extends StatelessWidget {
  final List<Elements> elem = [
    Elements('t1', 'todo','due wednesday' , '5/4/21', '25:54'),  
    Elements('t2', 'todo2', 'due thrsdy','13/4/21','23:43')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks'),),
        body: Column(
          children: <Widget>[
            Card( 
              color: Colors.orange,
              margin: EdgeInsets.all(10),
              child:Container(
              alignment: Alignment.center,
              child: Text('Your Tasks', style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),),
              
              width: 500,
              height: 50,),
            elevation: 7,),

            
            Column(
              children:
                elem.map((el) {
                  return InkWell( 
                    onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=> Details())),
                    child: Card(
                    
                    child:Container( 
                    
                    //width: 25,
                    alignment: Alignment.center,
                    
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration( border: Border.all(color: Colors.orange, width: 2)),
                    padding: EdgeInsets.all(10),
                    child:  Column(
                    children: <Widget>[
                    Text(el.tasktitle, style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25,
                      
                    ),),
                    Text(el.date),
                    Text(el.time)
                  ],)))) ;
                  }).toList(),
              
            )
          ],

           
        )
    );
  }
}