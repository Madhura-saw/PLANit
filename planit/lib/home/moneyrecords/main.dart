import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets/add_income.dart';
import 'widgets/add_expense.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MyApp(),
//   ));
// }

class Records extends StatefulWidget {
  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  final ref = FirebaseFirestore.instance.collection('income');
  final ref1 = FirebaseFirestore.instance.collection('expense');
  var totalIncome = 0;
  var totalExpense = 0;
  var balance = 0;

  @override
  void initState() {
    super.initState();
    tincome();
    texpense();
    tbalance();
  }

  Future<String> tincome() async {
    totalIncome = 0;
    QuerySnapshot snapshot = await ref.get();
    snapshot.docs.forEach((doc) {
      setState(() {
        totalIncome += int.parse(doc.get('incomes'));
      });
    });
    print(totalIncome);
    return totalIncome.toString();
  }

  Future<String> texpense() async {
    totalIncome = 0;
    QuerySnapshot snapshot = await ref1.get();
    snapshot.docs.forEach((doc) {
      setState(() {
        totalExpense += int.parse(doc.get('expenses'));
      });
    });
    print(totalExpense);
    return totalExpense.toString();
  }

  int tbalance() {
    balance = totalIncome - totalExpense;
    print(balance);
    return balance;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.orange.shade50,
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            'MONEY RECORDS',
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan,
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
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text(
                              "Choose Category",
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Income()));
                                    },
                                    child: const Text('\u{20B9} Add Income'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Expense()));
                                    },
                                    child: const Text('\u{20B9} Add Expenses'),
                                  ),
                                ],
                              ),
                            ],
                          ));
                },
                icon: Icon(Icons.add))
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text(
                  'Income',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Tab(
                child: Text(
                  'Expense',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder(
              stream: ref.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange.shade100,
                            ),
                            child: Container(
                              // padding: EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text(
                                  '\u{20B9}${snapshot.data!.docs[index]['incomes']}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                              snapshot.data!.docs[index]['income_category']),
                          subtitle:
                              Text(snapshot.data!.docs[index]['date_added']),
                          trailing: IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              snapshot.data!.docs[index].reference
                                  .delete()
                                  .whenComplete(() => null);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            // totalIncome += snapshot.data!.docs[index]['incomes'];
            StreamBuilder(
              stream: ref1.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                // {totalIncome += int.parse(snapshot.data!.docs[index]['incomes']);}
                return ListView.builder(
                  itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange.shade100,
                            ),
                            child: Container(
                              // padding: EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text(
                                  '\u{20B9}${snapshot.data!.docs[index]['expenses']}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                              snapshot.data!.docs[index]['expense_category']),
                          subtitle:
                              Text(snapshot.data!.docs[index]['date_added']),
                          trailing: IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              snapshot.data!.docs[index].reference
                                  .delete()
                                  .whenComplete(() => null);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Expanded(
                  child: ListTile(
                title: Text('Income'),
                subtitle: Text(totalIncome.toString()),
              )),
              Expanded(
                  child: ListTile(
                title: Text('Expenses'),
                subtitle: Text(totalExpense.toString()),
              )),
              Expanded(
                  child: ListTile(
                title: Text('Balance'),
                subtitle: Text((totalIncome - totalExpense).toString()),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
