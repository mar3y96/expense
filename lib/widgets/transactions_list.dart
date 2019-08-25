import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child:transactions.isEmpty?Column(
        children: <Widget>[
          Text('no trans actions'),
          SizedBox(
            height: 20,
          ),
          Container(child: Image.asset('assets/image/waiting.png',fit: BoxFit.cover,),height: 200,)
        ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                )),
                child: Text(
                  '\$${transactions[index].amount.toStringAsFixed(2)} ',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  )),
                  Text(
                    DateFormat.yMMMMd().format(transactions[index].date),
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  )
                ],
              ),
            ],
          )
              //
              );
        },
      ),
    );
  }
}
