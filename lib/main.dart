//to check on which platform the app is running ios or android below package is important
import 'dart:io';
//to use any cupertino widget use following package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisab_kitab/Module/transacation.dart';
import 'package:hisab_kitab/Widget/new_transaction.dart';
import 'package:hisab_kitab/Widget/transactionList.dart';
import './Module/transacation.dart';
import './Widget/chart.dart';
import 'package:flutter/services.dart';

void main() {
  //Below lines will not allow application to rotate 
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.orange,
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
  bool _showChart =false;
  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
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
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  // String? titleInput;
  // String? amountInput;
  @override
  Widget build(BuildContext context) {
    
    
    //store  boolen value if we are in landscape mode or not
    final isLandScape=MediaQuery.of(context).orientation==Orientation.landscape;
    
    final appBar=AppBar(
        title: const Text(
          "Hisab Kitab",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      );
      final txListWidget=Container(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.8,
                child: TransactionList(_userTransaction));
        //titleTextStyle: TextStyle(color: Colors.white),
       final pageBody=SafeArea(child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if(isLandScape)Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Show Text"),

                  //manage the switch accordingly to platform (i.e ios or android)
                  
                  Switch.adaptive(
                    value: _showChart, onChanged: (value) {
                    setState(() {
                      _showChart=value;
                      
                    });
                    
                  } )
                ],
              ),
              if(!isLandScape)
                Container(
                //deleting height of appbar ans status bar from total height of phone 
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.2,
                child: Chart(_recentTransactions)),
                if(!isLandScape)txListWidget,

              if(isLandScape)_showChart?Container(
                //deleting height of appbar ans status bar from total height of phone 
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top)*0.7,
                child: Chart(_recentTransactions)):
                txListWidget,
            ]),
       ));
    return Platform.isIOS? CupertinoPageScaffold(
      child: pageBody,

    ):Scaffold(
      appBar: appBar,
      body: pageBody,
    
      //if the app is running on ios the floating action will not rander 

      floatingActionButton: Platform.isIOS 
       ?Container()
      :FloatingActionButton(
        
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _startAddNewTransaction(context),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat

      
      );
      
      
    
  }
}
