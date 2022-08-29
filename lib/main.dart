import 'package:flutter/material.dart';
import 'package:hisab_kitab/Module/transacation.dart';
import 'package:hisab_kitab/Widget/new_transaction.dart';
import 'package:hisab_kitab/Widget/transactionList.dart';
import './Module/transacation.dart';
import './Widget/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange,
      accentColor: Colors.orange ,
      //buttonColor: Colors.red
      ),
      title: 'Hisab Kitab', 
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //     id: "t1", title: "New Shoes", amount: 99.99, date: DateTime.now()),
    // Transaction(
    //     id: "t2", title: "New Bottel", amount: 20.99, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7),),
      );
    }).toList() ;
  }

  void _addNewTransaction(String txTitle, double txAmount,DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bctx) {
        return GestureDetector(
          onTap: () => {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),);
      },
    );
  }

  // String? titleInput;
  // String? amountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hisab Kitab",style: TextStyle(fontSize: 25,color: Colors.white),
        ),
        //titleTextStyle: TextStyle(color: Colors.white),
        
        
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),color: Colors.white,
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[ 
              Chart(_recentTransactions),
              TransactionList(_userTransaction)
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: ()=>_startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
