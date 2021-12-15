import 'package:flutter/material.dart';
import 'package:planit/screens/notes_pg.dart';
import 'package:planit/screens/rec_pg.dart';
import 'package:planit/screens/rem_pg.dart';
import 'package:planit/screens/task_page.dart';
import 'package:planit/tiles.dart';
import './tiles.dart';
import './names.dart';
class FPage  extends StatelessWidget 
{
  void notescreen(BuildContext ctx){
  Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => NotesPage()));
}

void recscreen(BuildContext ctx){
  Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => RecPage()));
}

void taskscreen(BuildContext ctx){
  Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => TasksPage()));
}

void remscreen(BuildContext ctx){
  Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => RemPage()));
}


  @override
  Widget build(BuildContext context) 
  {
    return 
      Scaffold(
        appBar: AppBar(title: Text('PLANIT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34, color: Colors.white),),
        backgroundColor: Colors.blueAccent, leadingWidth: 100,),
        body:Container(
          child: Padding(padding: const EdgeInsets.all(10),
          child: GridView(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        //maxCrossAxisExtent:360,
        mainAxisExtent: 230,
        
        childAspectRatio: 6/6,
        crossAxisCount: 2,
        crossAxisSpacing: 1, mainAxisSpacing: 1,
        ), 
            children: [
              InkWell( 
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TasksPage())),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      
      
      child: Container(
      margin: const EdgeInsets.all(4),
      //color: Colors.purple[200],
      padding: const EdgeInsets.all(7),
      child:Center(child: Column(children: <Widget>[
        Expanded(child: Icon(Icons.task, size:50)),
        Text('Tasks')
      ],),) ,                                  //   Text(title),
      decoration: 
      BoxDecoration(
         
        shape: BoxShape.rectangle,
        gradient: LinearGradient(

          colors: [Colors.orange.shade100.withOpacity(0.7), Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      
    )),



    InkWell( 
      onTap: () => notescreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      
      
      child: Container(
      margin: const EdgeInsets.all(4),
      //color: Colors.purple[200],
      padding: const EdgeInsets.all(7),
      child:Center(child: Column(children: <Widget>[
        Expanded(child: Icon(Icons.notes, size:50)),
        Text('Notes')
      ],),) ,                                  //   Text(title),
      decoration: 
      BoxDecoration(
         
        shape: BoxShape.rectangle,
        gradient: LinearGradient(

          colors: [Colors.green.shade100.withOpacity(0.7), Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      
    )),



    InkWell( 
      onTap: () => recscreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      
      
      child: Container(
      margin: const EdgeInsets.all(4),
      //color: Colors.purple[200],
      padding: const EdgeInsets.all(7),
      child:Center(child: Column(children: <Widget>[
        Expanded(child: Icon(Icons.report, size:50)),
        Text('Records')
      ],),) ,                                  //   Text(title),
      decoration: 
      BoxDecoration(
         
        shape: BoxShape.rectangle,
        gradient: LinearGradient(

          colors: [Colors.blueGrey.shade100.withOpacity(0.7), Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      
    )),



    InkWell( 
      onTap: () => remscreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(25),
      
      
      child: Container(
      margin: const EdgeInsets.all(4),
      //color: Colors.purple[200],
      padding: const EdgeInsets.all(7),
      child:Center(child: Column(children: <Widget>[
        Expanded(child: Icon(Icons.add_alarm, size:50)),
        Text('Reminders')
      ],),) ,                                  //   Text(title),
      decoration: 
      BoxDecoration(
         
        shape: BoxShape.rectangle,
        gradient: LinearGradient(

          colors: [Colors.red.shade100.withOpacity(0.7), Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      
    )),



            ],
          )
          )
        )
        
        

        );
    
      
      
      
  }
}