import 'package:flutter/material.dart';
import '../Module/transacation.dart';
import './user_transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transacations;
  TransactionList(this.transacations);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView.builder(
          //create widget
          itemBuilder: (context, index) {
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
                      //only display two decimal point
                      "Rs." + transacations[index].amount.toStringAsFixed(2),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transacations[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        //formating date
                        Text(
                          DateFormat.yMMMd().format(transacations[index].date),
                          style: TextStyle(fontSize: 13),
                        )
                      ])
                ],
              ),
            );
          },
          //return no of iteams
          itemCount: transacations.length,
        ));
  }
}
