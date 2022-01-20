import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Expense extends StatefulWidget {
  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final CollectionReference ref1 =
      FirebaseFirestore.instance.collection('expense');

  TextEditingController expenseCategory = TextEditingController();
  TextEditingController expense = TextEditingController();
  DateTime? _selectedDateEx;

  void _presentDatePickerEx() {
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
        _selectedDateEx = pickedDate;
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
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: TextField(
              style: const TextStyle(
                fontSize: 17,
              ),
              controller: expenseCategory,
              decoration:
                  const InputDecoration(labelText: 'Expense Category :'),
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
              controller: expense,
              decoration: InputDecoration(labelText: 'Expenditure Amount :'),
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
                      child: Text(_selectedDateEx == null
                          ? 'No date chosen!'
                          : 'Date: ${DateFormat.yMd().format(_selectedDateEx!)}')),
                ),
                TextButton(
                  onPressed: _presentDatePickerEx,
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
            onPressed: () {
              ref1.add({
                'expense_category': expenseCategory.text,
                'expenses': expense.text,
                'date_added': DateFormat.yMMMd().format(_selectedDateEx!).toString(),
              }).whenComplete(() => Navigator.pop(context));
            },
            child: Text(
              'Save',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
