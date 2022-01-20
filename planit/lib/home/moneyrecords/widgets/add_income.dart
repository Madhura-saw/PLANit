import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

class Income extends StatefulWidget {
  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('income');

  TextEditingController incomeCategory = TextEditingController();
  TextEditingController income = TextEditingController();
  DateTime? _selectedDateIn;

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
        _selectedDateIn = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: TextField(
              style: TextStyle(
                fontSize: 17,
              ),
              controller: incomeCategory,
              decoration: InputDecoration(labelText: 'Income Category :'),
              onSubmitted: (_) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 17,
              ),
              controller: income,
              decoration: InputDecoration(labelText: 'Income Amount :'),
              onSubmitted: (_) {},
            ),
          ),
          Container(
            height: 80,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Expanded(
                      child: Text(_selectedDateIn == null
                          ? 'No date chosen!'
                          : 'Date: ${DateFormat.yMMMd().format(_selectedDateIn!)}')),
                ),
                TextButton(
                  onPressed: _presentDatePickerIn,
                  child: Text(
                    'Choose date',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            child: Text(
              'Save',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            onPressed: () {
                ref.add({
                'income_category': incomeCategory.text,
                'incomes': income.text,
                'date_added': DateFormat.yMMMd().format(_selectedDateIn!).toString(),
              }).whenComplete(() => Navigator.pop(context));
            },
          )
        ],
      ),
    );
  }
}
