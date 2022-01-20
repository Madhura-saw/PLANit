import 'package:flutter/material.dart';

class AddNotes {
  int id;
  String title;
  String content;
  DateTime dateCreated;
  DateTime dateLastEdited;
  Color noteColor;

  AddNotes({
    required this.id,
    required this.title,
    required this.content,
    required this.dateCreated,
    required this.dateLastEdited,
    required this.noteColor,
  });

}
