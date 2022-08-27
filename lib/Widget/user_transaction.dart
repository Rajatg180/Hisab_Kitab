import 'package:flutter/material.dart';
import './transactionList.dart';
import '../Module/transacation.dart';
import './new_transaction.dart';

class UserTranaction extends StatefulWidget {
  const UserTranaction({super.key});

  @override
  State<UserTranaction> createState() => _UserTranactionState();
}

class _UserTranactionState extends State<UserTranaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 99.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Bottel", amount: 20.99, date: DateTime.now()),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //passing pointer to the function
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction)
      ],
    );
  }
}
