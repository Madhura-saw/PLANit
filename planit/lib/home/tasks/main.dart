import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'newinput.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tasks',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TasksPage(),
    );
  }
}

class TasksPage extends StatefulWidget {
  @override
  TasksPageState createState() => TasksPageState();
}

class TasksPageState extends State<TasksPage> {
  final ref = FirebaseFirestore.instance.collection('tasks');
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.shade50,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: Text(
            'TASKS',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Colors.orange.shade800,
                  Colors.orangeAccent.shade200,
                ])),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Card(
                color: Colors.orange,
                margin: EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Your Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width / 2.0,
                  height: 50,
                ),
                elevation: 7,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                  stream: ref.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return ListView.builder(
                      itemCount:
                          snapshot.hasData ? snapshot.data!.docs.length : 0,
                      itemBuilder: (_, index) {
                        return Card(
                          // elevation: 5,
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            // leading: const Icon(
                            //   Icons.circle,
                            //   color: Colors.red,
                            // ),
                            title: Text(snapshot.data!.docs[index]['title']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data!.docs[index]['details']),
                                Text(snapshot.data!.docs[index]['date']),
                                Text(snapshot.data!.docs[index]['time']),
                              ],
                            ),
                            leading: IconButton(
                              iconSize: 30,
                              color: Colors.orange,
                              icon: Icon(Icons.check_box),
                              onPressed: () {
                                showDialog(
                                    context: context, builder: (context)=>AlertDialog(
                                      content: Text(' Congrats! 🎉 You completed a task ! 🎉'),
                                    ),);
                                snapshot.data!.docs[index].reference
                                    .delete()
                                    .whenComplete(() => null);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NewInput()));
          },
        ));
  }
}
