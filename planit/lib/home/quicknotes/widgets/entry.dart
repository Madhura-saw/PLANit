import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Entry extends StatefulWidget {
  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  TextEditingController title = TextEditingController();

  TextEditingController content = TextEditingController();

  String dateCreated = DateFormat.yMMMd().format(DateTime.now());

  final CollectionReference ref =
      FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              ref.add({
                'title': title.text,
                'content': content.text,
                'date': dateCreated.toString(),
              }).whenComplete(() => Navigator.pop(context));
            },
            icon: Icon(Icons.save),
            tooltip: "Save",
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 10, color: Colors.white)),
              child: TextField(
                maxLength: 30,
                style: TextStyle(
                  fontSize: 20,
                ),
                controller: title,
                decoration: InputDecoration(labelText: 'TITLE '),
                onSubmitted: (_) {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 10, color: Colors.white)),
                child: TextField(
                  maxLines: null,
                  expands: true,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  controller: content,
                  decoration: InputDecoration(labelText: 'YOUR NOTES'),
                  onSubmitted: (_) {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
