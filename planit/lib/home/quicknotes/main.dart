import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'models/edit_notes.dart';
import 'widgets/entry.dart';
import 'package:intl/intl.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QUICK NOTES',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.orange,
      ),
      // home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ref = FirebaseFirestore.instance.collection('notes');

  final List colors = [
    Color(0xffffffff), // classic white
    Color(0xfff28b81), // light pink
    Color(0xfff7bd02), // yellow
    Color(0xfffbf476), // light yellow
    Color(0xffcdff90), // light green
    Color(0xffa7feeb), // turquoise
    Color(0xffcbf0f8), // light cyan
    Color(0xffafcbfa), // light blue
    Color(0xffd7aefc), // plum
    Color(0xfffbcfe9), // misty rose
    Color(0xffe6c9a9), // light brown
    Color(0xffe9eaee) // light gray
  ];
  Random random = new Random();

  // int index1 = 0;

  // void changeIndex() {
  //   setState(() => index1 = random.nextInt(12));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'QUICKNOTES',
          style: TextStyle(fontFamily: 'OpenSans',fontSize: 25),
        ),
        foregroundColor: Colors.white,
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
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditNote(
                                  docToEdit: snapshot.data!.docs[index])));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors[random.nextInt(12)],
                      ),
                      height: 150,
                      child: Column(
                        children: [
                          Flexible(
                            child: Text(
                              snapshot.data!.docs[index]['title'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                  fontSize: 20),
                                  overflow:TextOverflow.ellipsis,
                            ),
                          ),
                          Text('    '),
                          Flexible(
                            child: Text(
                              snapshot.data!.docs[index]['content'],
                              style: TextStyle(fontSize: 20,fontFamily: 'OpenSans'),
                              overflow:TextOverflow.ellipsis,
                            ),
                          ),
                          // Text(
                          //   DateFormat.yMMMd().format(snapshot.data!.docs[index]['date']),
                          //   style: TextStyle(fontSize: 13, color: Colors.grey),
                          // ),
                          Text(snapshot.data!.docs[index]['date'],
                              style: TextStyle(fontSize: 13))
                        ],
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
        tooltip: "Add new note",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Entry()));
        },
      ),
    );
  }
}
