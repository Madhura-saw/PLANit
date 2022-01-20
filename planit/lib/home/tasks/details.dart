import 'package:flutter/material.dart';
import 'elements.dart';

class Details extends StatelessWidget {
  final Elements elemen;
  Details(this.elemen);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 5),
            ),
            child: Column(children: <Widget>[
              Text(elemen.tasktitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  )),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Card(
                    elevation: 10,
                    color: Colors.grey,
                    child: Text('Details:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 20, left: 20),
                child: Text(elemen.details,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Card(
                      elevation: 10,
                      color: Colors.grey,
                      child: Text('Due:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )))),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(elemen.date,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(elemen.time,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    ],
                  ))
            ])));
  }
}
