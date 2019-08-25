import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transactions_list.dart';

import './models/transaction.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transactions = [
    Transaction(id: 't1', amount: 20.9, title: 'trans1', date: DateTime.now()),
    Transaction(id: 't2', amount: 10.9, title: 'trans2', date: DateTime.now()),
    Transaction(id: 't3', amount: 15.9, title: 'trans3', date: DateTime.now()),
    Transaction(id: 't4', amount: 9.9, title: 'trans4', date: DateTime.now()),
  ];

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
        
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _startAddTransAction(BuildContext ctx) {
    print('test');
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
                return GestureDetector(
                  onTap: () {print('test');},
                  child: NewTransaction(_addTransaction),
                  behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;
     

    return MaterialApp(
      
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                color: Colors.purple
              )
            ),
            appBarTheme: AppBarTheme(color: Colors.blue,
            textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold
              ),
            ),
            ),
            fontFamily: 'Quicksand'
            ),
        debugShowCheckedModeBanner: false,
        title: 'expense',
        home: Scaffold(
          appBar: AppBar(
            title: Text('home'),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add,
                ),
                // onPressed: () =>showModalBottomSheet,
                onPressed: (){},
                // onPressed: () => _startAddTransAction(context),
                // onPressed: () => print(size),
              )
            ],
          ),
          body: new SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Card(
                  child: Container(width: 100, child: Text('CHARTS')),
                ),
                NewTransaction(_addTransaction),
                TransactionList(_transactions),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), 
            // onPressed: () {},
            onPressed: () => _startAddTransAction(context)),
          ),
        );
  }
}
