import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  DocumentSnapshot docToEdit;
  EditNote({required this.docToEdit});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docToEdit['title']);
    content = TextEditingController(text: widget.docToEdit['content']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget.docToEdit.reference.update({
                'title': title.text,
                'content': content.text,
              }).whenComplete(() => Navigator.pop(context));
              // ref.add({
              //   'title': title.text,
              //   'content': content.text,
              // }).whenComplete(() => Navigator.pop(context));
            },
            icon: Icon(Icons.save),
            tooltip: "Save",
          ),
          IconButton(
            onPressed: () {
              widget.docToEdit.reference
                  .delete()
                  .whenComplete(() => Navigator.pop(context));
            },
            icon: Icon(Icons.delete),
          )
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
