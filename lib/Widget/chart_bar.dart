import 'package:flutter/material.dart';
class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctAmount;

  ChartBar(this.label,this.spendingAmount,this.spendingPctAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //used to fit text the widget without increasing widget
        Container(
          height: 20,
          child: FittedBox(child: Text("Rs."+spendingAmount.toStringAsFixed(0)))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 15,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1.0),
                  color: Color.fromRGBO(220,220,220,1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctAmount,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          label
        )
      ],
    );
  }
}