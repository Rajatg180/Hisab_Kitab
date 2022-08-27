import 'package:flutter/material.dart';
import 'package:hisab_kitab/Module/transacation.dart';
import 'package:hisab_kitab/Widget/user_transaction.dart';

import 'package:intl/intl.dart';

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
  // String? titleInput;
  // String? amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hisab Kitab",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "Chart",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                elevation: 30,
              ),
              UserTranaction()
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (() {}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
