import 'package:flutter/material.dart';
import 'package:hisab_kitab/Module/transacation.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget { 
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String,dynamic>> get groupedTransactionValues{
    return List.generate(7, (index) {
      //calculating week day
      final weekDay =DateTime.now().subtract(Duration(days: index),);
      //finding all transaction happen on that day
      var totalSum=0.0;
      for(var i=0; i< recentTransaction.length;i++){
        if(recentTransaction[i].date.day==weekDay.day 
        && recentTransaction[i].date.year==weekDay.year
        && recentTransaction[i].date.month==weekDay.month )
        totalSum+=recentTransaction[i].amount;
      }
      return {'day': DateFormat.E().format(weekDay).substring(0,3),'amount':totalSum,};
    });
  }
  
  double get totalSpending{
    return groupedTransactionValues.fold(0.0, (sum,iteam) {
      return sum + iteam['amount'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.all(15),
      
      elevation: 6,
      child:  Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: groupedTransactionValues.map((data) {
          //SizedBox(width: 10,);
          return ChartBar(data['day'], data['amount'],totalSpending==0.0?0.0:(data['amount'] as double)/totalSpending);
        }).toList(), 
      ),
      
    );
  }
}