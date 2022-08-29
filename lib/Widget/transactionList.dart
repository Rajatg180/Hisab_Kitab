import 'package:flutter/material.dart';
import '../Module/transacation.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transacations;
  TransactionList(this.transacations);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: transacations.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "No transaction added yet !",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontSize: 20),
                  ),
                  //SizedBox() is used to add spacing betwen two widget
                  //SizedBox(height: 20,),
                  Image.asset('assets/images.jpg')
                ],
              )
            : ListView.builder(
                //create widget
                itemCount: transacations.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 10,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              border: Border.all(
                                
                                //color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              //only display two decimal point
                              "Rs." +
                                  transacations[index]
                                      .amount
                                      .toStringAsFixed(2),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                //formating date
                                Text(
                                  DateFormat.yMMMd()
                                      .format(transacations[index].date),
                                  style: TextStyle(fontSize: 13),
                                )
                              ]),
                            
                        ],
                      ),
                    ),
                  );
                },
                //return no of iteams
              ));
  }
}
