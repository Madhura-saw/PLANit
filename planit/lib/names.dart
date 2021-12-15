
//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planit/screens/notes_pg.dart';

//import 'package:flutter/rendering.dart';
class Names  extends StatelessWidget {
  final title;
  final color;
  final icon;
  final id;
  final gt;


  Names(this.title,this.color,this.icon, this.id, this.gt);


// void selectTile(BuildContext ctx){
//   Navigator.of(ctx).pushNamed(
//     '/tiles', arguments: {'id':id, 'title': title}
//   );
// }
void notescreen(BuildContext ctx){
  Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => NotesPage()));
}

  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap: () =>  gt,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      
      
      child: Container(
      margin: const EdgeInsets.all(4),
      //color: Colors.purple[200],
      padding: const EdgeInsets.all(7),
      child:Center(child: Column(children: <Widget>[
        Expanded(child: Icon(icon, size:50)),
        Text(title)
      ],),) ,                                  //   Text(title),
      decoration: 
      BoxDecoration(
         
        shape: BoxShape.rectangle,
        gradient: LinearGradient(

          colors: [color.withOpacity(0.7), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      
    ));
  }
}