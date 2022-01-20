import 'package:authentication/home/quicknotes/main.dart';
import 'home/moneyrecords/main.dart';
import 'package:authentication/widget/logged_in_widget.dart';
import 'package:flutter/material.dart';
import 'home/tasks/main.dart';
import 'home/reminders/main.dart';
import 'home/reminders/dynamic_event.dart';

class FPage extends StatelessWidget {
  void notescreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => MyHomePage()));
  }

  void recscreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => Records()));
  }

  void taskscreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => TasksPage()));
  }

  void remscreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => DynamicEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Colors.orange.shade300,
                Colors.pink,
                Colors.orange.shade300
              ])),
        ),
        title: Text(
          'PLANit',
          style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontFamily: 'Lobster',
              fontWeight: FontWeight.w100),
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => LoggedInWidget()));
              },
              icon: Icon(Icons.account_circle, size: 50),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange.shade300,
        elevation: 5,
        fixedColor: Colors.blueGrey.shade800,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: Container(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //maxCrossAxisExtent:360,
                  mainAxisExtent: 230,

                  childAspectRatio: 6 / 6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 1, mainAxisSpacing: 1,
                ),
                children: [
                  InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TasksPage())),
                      splashColor: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        //color: Colors.purple[200],
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Expanded(child: Icon(Icons.task, size: 50)),
                              Text(
                                'Tasks',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ), //   Text(title),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.orange.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      )),
                  InkWell(
                      onTap: () => notescreen(context),
                      splashColor: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        //color: Colors.purple[200],
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Expanded(child: Icon(Icons.notes, size: 50)),
                              Text(
                                'QuickNotes',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ), //   Text(title),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.orange.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      )),
                  InkWell(
                      onTap: () => recscreen(context),
                      splashColor: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        //color: Colors.purple[200],
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: Icon(Icons.credit_score, size: 50)),
                              Text(
                                'Records',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ), //   Text(title),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.orange.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      )),
                  InkWell(
                      onTap: () => remscreen(context),
                      splashColor: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        //color: Colors.purple[200],
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Expanded(child: Icon(Icons.add_alarm, size: 50)),
                              Text(
                                'Reminders',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ), //   Text(title),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.orange.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      )),
                ],
              ))),
    );
  }
}
