import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hisab_kitab/transacation.dart';
import './transacation.dart';

void main() {
  runApp(MyHisab());
}

class MyHisab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transacation = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 99.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Bottel", amount: 20.99, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hisab Kitab",
        ),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Card(
         
          child: Container(
            width: double.infinity,
            height: 200,
            child: Text(
              "Chart",
              style: TextStyle(
                color: Colors.blue ,
              ),
            ),
          ),
          elevation: 30,
        ),
        Column(
          children: transacation.map((tx) {
            return Card(
              elevation: 30,
              
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Text(
                      "Rs."+tx.amount.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                    Text(
                      tx.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Text(tx.date.toString(),
                    style: TextStyle(fontSize: 10),)

                    
                  ])
                ],
              ),
            );
          }).toList(),
        )
      ]),
    );
  }
}
