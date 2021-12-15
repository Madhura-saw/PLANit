

import 'dart:ffi';

import 'package:planit/screens/notes_pg.dart';
import 'package:planit/screens/rec_pg.dart';
import 'package:planit/screens/rem_pg.dart';
import 'package:planit/screens/task_page.dart';

import './models/features.dart';
import 'package:flutter/material.dart';

  
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




  var TileNames =[
   FeatNames(
    'i1', 
    'Reminders', 
    Colors.lightBlueAccent.shade400,
    Icons.add_alarm,
    remscreen
    

    ),
    FeatNames(
    'i2', 
    'Tasks', 
    Colors.blue.shade100,
    Icons.task,
    taskscreen
    ),
    FeatNames(
    'i3', 
    'Quick Notes', 
    Colors.lightBlueAccent.shade100,
    Icons.notes,
    notescreen

    ),
    FeatNames(
   'i4', 
    'Records', 
    Colors.lightBlueAccent,
    Icons.report,
    recscreen
    )
];
