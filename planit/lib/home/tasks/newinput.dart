import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewInput extends StatefulWidget {
  // final Function addTask;
  @override
  State<NewInput> createState() => _NewInputState();
}

class _NewInputState extends State<NewInput> {
  TextEditingController titleController = TextEditingController();

  TextEditingController timeController = TextEditingController();

  TextEditingController detailController = TextEditingController();

  DateTime? _selectedDate;

  final CollectionReference ref =
      FirebaseFirestore.instance.collection('tasks');

  void _presentDatePickerIn() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.orange)),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: timeController,
                  decoration: InputDecoration(labelText: 'Time')),
              TextField(
                  controller: detailController,
                  decoration: InputDecoration(labelText: 'Detail')),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.all(5),
                child: Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date chosen!'
                        : 'Date: ${DateFormat.yMMMd().format(_selectedDate!)}')),
              ),
              TextButton(
                onPressed: _presentDatePickerIn,
                child: Text(
                  'Choose date',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                child: const Text(
                  'Add to list',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  ref.add({
                    'title': titleController.text,
                    'details': detailController.text,
                    'time': timeController.text,
                    'date':
                        DateFormat.yMMMd().format(_selectedDate!).toString(),
                  }).whenComplete(() => Navigator.pop(context));
                },
                style: TextButton.styleFrom(
                  primary: Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
