import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'Shoes', amount: 259.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Groceries', amount: 459.99, date: DateTime.now())
  ];
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Expenses'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue[200],
                child: Text('Chart!!!'),
                elevation: 5,
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Add Transaction'),
                      textColor: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions
                  .map((transaction) => Card(
                          child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.purple[900], width: 2)),
                            child: Text('\$${transaction.amount}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.purple[900])),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                transaction.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                DateFormat()
                                    .add_yMMMd()
                                    .format(transaction.date),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              )
                            ],
                          )
                        ],
                      )))
                  .toList(),
            )
          ],
        ));
  }
}
