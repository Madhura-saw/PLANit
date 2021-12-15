import 'package:flutter/material.dart';
import 'package:planit/tiles.dart';
import './tiles.dart';
import './names.dart';
class FirstPage  extends StatelessWidget 
{
  
  @override
  Widget build(BuildContext context) 
  {
    return 
      Scaffold(
        appBar: AppBar(title: Text('PLANIT'),),
        body: Container(
          margin: const EdgeInsets.all(18),
          child:  GridView(children: TileNames.map((catdata) => Names(catdata.name, catdata.color, catdata.icon, catdata.id, catdata.goto)).toList(),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        //maxCrossAxisExtent:360,
        mainAxisExtent: 230,
        
        childAspectRatio: 6/6,
        crossAxisCount: 2,
        crossAxisSpacing: 1, mainAxisSpacing: 1,
        ),  
      ),),
        floatingActionButton: FloatingActionButton(
          child:Container(
      margin: const EdgeInsets.all(20),
      //color: Colors.purple[200],
      padding: const EdgeInsets.all(1),
      child:Center(child: Column(children: <Widget>[
        
        Text('Notifications')
      ],),) ,                                  //   Text(title),
      decoration: 
      BoxDecoration(
         
        shape: BoxShape.rectangle,
        gradient: LinearGradient(

          colors: [Colors.blueGrey.withOpacity(0.9), Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      
    ),
     onPressed:(){ print('clicked');}
          ),
          

        );
    
      
      
      
  }
}